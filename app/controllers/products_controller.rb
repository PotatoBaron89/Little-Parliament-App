class ProductsController < ApplicationController
  before_action :check_permissions, only: %i[ create edit update destroy ]    # check if user is an admin

  before_action :set_product, only: %i[ show edit update destroy ]            # set @product based on param
  before_action :authenticate_user, except: %i[ show index ]                  # check if user has a session

  # GET /products or /products.json, returns array of objects in json
  def index
    @products = Product.all

    response = @products.map do |product|
      {
        product: {
          "id": product.id,
          "title": product.title,
          "description": product.description,
          "price": product.price,
          "image": Rails.env.production? ? product.image.url : "nil",
          "sale_percent": product.sale_percent,
          "sale_price": product.discounted_price,
          "featured": product.featured,
          "qty": product.qty
        }
      }
    end

    render json: response
  end

  # GET /products/1 or /products/1.json
  def show
    render json: {
      "id": @product.id,
      "title": @product.title,
      "description": @product.description,
      "price": @product.price,
      "image": @product.image.url,
      "sale_percent": @product.sale_percent,
      "sale_price": @product.discounted_price,
      "featured": @product.featured,
      "qty": @product.qty
    }
  end

  # POST /products or /products.json, creates a new Product item
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.json { render :show, status: :created, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1 or /products/1.json updates existing product item
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.json { render :show, status: :ok, location: @product }
      else
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json deletes an existing item
  def destroy
    @product.destroy

    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_product
    @product = Product.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def product_params
    params.permit(:title, :description, :price, :image, :featured, :qty, :sale_percent)
  end
end
