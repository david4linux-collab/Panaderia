class OrdersController < ApplicationController
  before_action :set_order, only: %i[show edit update destroy update_status]
  before_action :set_customers, only: %i[new create edit update]
  before_action :set_products, only: %i[new create edit update]

  def index
    @orders = Order.ordered
    @orders = @orders.by_status(params[:status]) if params[:status].present?
    @orders = @orders.today if params[:today] == "true"
  end

  def show; end

  def new
    @order = Order.new
    build_order_items(@order)
  end

  def create
    @order = Order.new(order_params)
    if @order.save
      redirect_to @order, notice: "Pedido creado correctamente."
    else
      build_order_items(@order)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    build_order_items(@order) if @order.order_items.empty?
  end

  def update
    if @order.update(order_params)
      redirect_to @order, notice: "Pedido actualizado correctamente."
    else
      build_order_items(@order)
      render :edit, status: :unprocessable_entity
    end
  end

  def update_status
    if @order.update(status: params[:status])
      redirect_to @order, notice: "Estado del pedido actualizado."
    else
      redirect_to @order, alert: "No se pudo actualizar el estado."
    end
  end

  def destroy
    @order.destroy
    redirect_to orders_path, notice: "Pedido eliminado correctamente.", status: :see_other
  end

  private

  def set_order
    @order = Order.find(params[:id])
  end

  def set_customers
    @customers = Customer.ordered
  end

  def set_products
    @products = Product.available.ordered
  end

  def order_params
    params.require(:order).permit(:customer_id, :status, :notes,
                                  order_items_attributes: [ :id, :product_id, :quantity, :price, :_destroy ])
  end

  def build_order_items(order)
    return if order.order_items.any?
    Product.available.ordered.each do |product|
      order.order_items.build(product: product, price: product.price)
    end
  end
end
