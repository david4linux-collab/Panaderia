require "test_helper"

class ProductTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    product = Product.new(name: "Test", price: 10, category: categories(:pan), available: true)
    assert product.valid?
  end

  test "should require name" do
    product = Product.new
    assert_not product.valid?
    assert_includes product.errors[:name], "can't be blank"
  end

  test "should require price" do
    product = Product.new(name: "Test", category: categories(:pan))
    assert_not product.valid?
    assert_includes product.errors[:price], "can't be blank"
  end

  test "should have positive price" do
    product = Product.new(name: "Test", price: -1, category: categories(:pan))
    assert_not product.valid?
  end

  test "should belong to category" do
    product = products(:pan_lactal)
    assert_equal categories(:pan), product.category
  end
end
