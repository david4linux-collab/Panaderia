require "test_helper"

class CustomerTest < ActiveSupport::TestCase
  test "should be valid with valid attributes" do
    customer = Customer.new(name: "Test", email: "test@test.com", phone: "123", address: "Calle 123")
    assert customer.valid?
  end

  test "should require name" do
    customer = Customer.new
    assert_not customer.valid?
  end

  test "should have unique email" do
    Customer.create!(name: "A", email: "test@test.com", phone: "123", address: "Calle")
    customer = Customer.new(name: "B", email: "test@test.com", phone: "456", address: "Calle")
    assert_not customer.valid?
  end

  test "email format should be valid" do
    customer = Customer.new(name: "Test", email: "invalid", phone: "123", address: "Calle")
    assert_not customer.valid?
  end
end
