class Order < ApplicationRecord
  belongs_to :customer
  has_many :order_items, dependent: :destroy
  has_many :products, through: :order_items, source: :product

  enum :status, { pending: "pending", preparing: "preparing", ready: "ready", completed: "completed", cancelled: "cancelled" }

  validates :customer, presence: true
  validates :status, presence: true, inclusion: { in: statuses.keys }
  validates :total, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :notes, length: { maximum: 1000 }

  scope :ordered, -> { order(created_at: :desc) }
  scope :recent, -> { ordered.limit(10) }
  scope :by_status, ->(status) { where(status: status) }
  scope :today, -> { where(created_at: Date.current.beginning_of_day..Date.current.end_of_day) }

  after_initialize :set_defaults, if: :new_record?
  before_validation :calculate_total, if: -> { order_items.any? }

  def add_product(product, quantity)
    order_items.build(product: product, quantity: quantity, price: product.price)
  end

  def subtotal
    order_items.to_a.sum(&:subtotal)
  end

  def item_count
    order_items.sum(:quantity)
  end

  def can_be_cancelled?
    !completed? && !cancelled?
  end

  private

  def set_defaults
    self.status ||= :pending
    self.total ||= 0
  end

  def calculate_total
    self.total = order_items.to_a.sum(&:subtotal)
  end
end
