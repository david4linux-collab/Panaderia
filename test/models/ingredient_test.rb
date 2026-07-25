require "test_helper"

class IngredientTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    ingredient = Ingredient.new(name: "Test", unit: "kg", cost: 1, stock: 10)
    assert ingredient.valid?
  end

  test "should require name" do
    ingredient = Ingredient.new
    assert_not ingredient.valid?
  end

  test "low_stock scope works" do
    assert_not_empty Ingredient.low_stock
  end
end
