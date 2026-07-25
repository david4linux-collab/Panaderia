class DashboardController < ApplicationController
  def index
    @total_products = Product.count
    @available_products = Product.available.count
    @total_ingredients = Ingredient.count
    @low_stock_ingredients = Ingredient.low_stock.count
    @total_orders = Order.count
    @today_orders = Order.today.count
    @pending_orders = Order.pending.count
    @total_customers = Customer.count
    @today_revenue = Order.today.completed.sum(:total)
    @recent_orders = Order.recent
    @low_stock_list = Ingredient.low_stock.ordered
  end
end
