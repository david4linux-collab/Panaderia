class ProductIngredient < ApplicationRecord
  belongs_to :product
  belongs_to :ingredient

  validates :quantity, presence: true, numericality: { greater_than: 0 }
  validates :product, uniqueness: { scope: :ingredient }

  scope :ordered, -> { includes(:ingredient).order("ingredients.name") }
end
