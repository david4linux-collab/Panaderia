class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]
  before_action :set_categories, only: %i[new create edit update]

  def index
    @products = Product.ordered
    @products = @products.available if params[:available] == "true"
    @products = @products.where(category_id: params[:category_id]) if params[:category_id].present?
  end

  def show; end

  def new
    @product = Product.new
    build_product_ingredients(@product)
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: "Producto creado correctamente."
    else
      build_product_ingredients(@product)
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    build_product_ingredients(@product) if @product.product_ingredients.empty?
  end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: "Producto actualizado correctamente."
    else
      build_product_ingredients(@product)
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @product.destroy
    redirect_to products_path, notice: "Producto eliminado correctamente.", status: :see_other
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def set_categories
    @categories = Category.ordered
    @ingredients = Ingredient.ordered
  end

  def product_params
    params.require(:product).permit(:name, :description, :price, :category_id, :available,
                                    product_ingredients_attributes: [ :id, :ingredient_id, :quantity, :_destroy ])
  end

  def build_product_ingredients(product)
    return if product.product_ingredients.any?
    Ingredient.ordered.each do |ingredient|
      product.product_ingredients.build(ingredient: ingredient)
    end
  end
end
