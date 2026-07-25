require "test_helper"

class ProductIngredientTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    pi = ProductIngredient.new(product: products(:croissant), ingredient: ingredients(:harina), quantity: 1)
    assert pi.valid?
  end

  test "should require quantity" do
    pi = ProductIngredient.new
    assert_not pi.valid?
  end
end
