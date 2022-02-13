class DrinksController < ApplicationController
  before_action :check_permissions, only: %i[ create edit update destroy ]  # check if user is an admin

  before_action :set_drink, only: %i[ show edit update destroy ]            # set @drink based on param
  before_action :authenticate_user, except: %i[ show index ]                # check if user has a session

  # GET /drinks or /drinks.json, returns array of objects in json
  def index
    @drinks = Drink.all

    response = @drinks.map do |drink|
      {
        food: {
          "id":drink.id,
          "title": drink.title,
          "description": drink.description,
          "price": drink.price,
          "image": Rails.env.production? ? drink.image.url : "nil",
          "category": drink.category
        }
      }
    end

    render json: response
  end

  # GET /drinks/1 or /drinks/1.json
  def show
    render json: {
      "id": @drink.id,
      "title": @drink.title,
      "description": @drink.description,
      "price": @drink.price,
      "image": @drink.image.url,
      "category": @drink.category
    }
  end

  # POST /drinks or /drinks.json, creates a new Drink item
  def create
    @drink = Drink.new(drink_params)

    respond_to do |format|
      if @drink.save
        format.json { render :show, status: :created, location: @drink }
      else
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /drinks/1 or /drinks/1.json, updates an existing drink item
  def update
    respond_to do |format|
      if @drink.update(drink_params)
        format.json { render :show, status: :ok, location: @drink }
      else
        format.json { render json: @drink.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /drinks/1 or /drinks/1.json, destroys an existing drinks item
  def destroy
    @drink.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_drink
    @drink = Drink.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def drink_params
    params.permit(:title, :description, :price, :image, :category)
  end
end
