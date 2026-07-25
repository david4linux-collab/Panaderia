class Product < ApplicationRecord
  belongs_to :category
  has_many :product_ingredients, dependent: :destroy
  has_many :ingredients, through: :product_ingredients
  has_many :order_items, dependent: :destroy

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :description, length: { maximum: 1000 }
  validates :price, presence: true, numericality: { greater_than: 0 }
  validates :available, inclusion: { in: [ true, false ] }

  scope :available, -> { where(available: true) }
  scope :ordered, -> { order(:name) }

  def available?
    available
  end

  def total_cost
    product_ingredients.sum do |pi|
      pi.ingredient.cost * pi.quantity
    end
  end

  def profit_margin
    return 0 if total_cost.zero?
    ((price - total_cost) / price * 100).round(2)
  end
end
