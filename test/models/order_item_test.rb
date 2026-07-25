require "test_helper"

class OrderItemTest < ActiveSupport::TestCase
  test "should calculate subtotal" do
    item = order_items(:item1)
    assert_equal 9.00, item.subtotal
  end

  test "should require quantity" do
    item = OrderItem.new
    assert_not item.valid?
  end
end
