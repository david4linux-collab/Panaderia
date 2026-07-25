class Ingredient < ApplicationRecord
  has_many :product_ingredients, dependent: :destroy
  has_many :products, through: :product_ingredients

  validates :name, presence: true, uniqueness: { case_sensitive: false }
  validates :unit, presence: true, inclusion: { in: %w[kg g litro ml unidad] }
  validates :cost, presence: true, numericality: { greater_than_or_equal_to: 0 }
  validates :stock, presence: true, numericality: { greater_than_or_equal_to: 0 }

  scope :ordered, -> { order(:name) }
  scope :low_stock, -> { where("stock <= ?", 1) }

  def low_stock?
    stock <= 1
  end

  def update_stock!(quantity_change)
    new_stock = stock + quantity_change
    raise "Insufficient stock" if new_stock < 0
    update!(stock: new_stock)
  end
end
