require "test_helper"

class CategoryTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    category = Category.new(name: "Test")
    assert category.valid?
  end

  test "should require name" do
    category = Category.new
    assert_not category.valid?
    assert_includes category.errors[:name], "can't be blank"
  end

  test "should have unique name" do
    Category.create!(name: "Unico")
    category = Category.new(name: "Unico")
    assert_not category.valid?
    assert_includes category.errors[:name], "has already been taken"
  end

  test "should have products" do
    assert_respond_to categories(:pan), :products
  end
end
