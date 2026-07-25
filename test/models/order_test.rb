require "test_helper"

class OrderTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    order = Order.new(customer: customers(:maria), status: "pending", total: 0)
    assert order.valid?
  end

  test "should calculate total from items" do
    order = orders(:pedido1)
    assert_equal 12.00, order.total
  end

  test "should have item_count" do
    order = orders(:pedido1)
    assert_equal 3, order.item_count
  end

  test "should have subtotal" do
    order = orders(:pedido1)
    assert_equal 12.00, order.subtotal
  end
end
