class FoodsController < ApplicationController
  before_action :check_permissions, only: %i[ create edit update destroy ]    # check if user is an admin

  before_action :set_food, only: %i[ show edit update destroy ]               # set @food based on param
  before_action :authenticate_user, except: %i[ show index ]                  # check if user has a session

  # GET /foods or /foods.json, returns array of objects in json
  def index
    @food = Food.all
    response = @food.map do |food|
      {
        food: {
          "id": food.id,
          "title": food.title,
          "description": food.description,
          "price": food.price,
          # Will break dev and testing without conditional, only prod has uses A3, others use local
          "image": Rails.env.production? ? food.image.url : "nil",
          "category": food.category,
          "meal_category": food.meal_category
        }
      }
    end

    render json: response
  end

  # GET /foods/1 or /foods/1.json
  def show
    render json: {
      "id": @food.id,
      "title": @food.title,
      "description": @food.description,
      "price": @food.price,
      "image": Rails.env.production? ? @food.image.url : "nil",
      "category": @food.category,
      "meal_category": @food.meal_category
    }
  end

  # POST /foods or /foods.json, creates a new Product item
  def create
    @food = Food.new(food_params)

    respond_to do |format|
      if @food.save
        format.json { render :show, status: :created, location: @food }
      else
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /foods/1 or /foods/1.json, updates an existing food item
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.json { render :show, status: :ok, location: @food }
      else
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json, deletes an existing food item
  def destroy
    @food.destroy

    respond_to do |format|
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_food
    @food = Food.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def food_params
    params.permit(:title, :description, :price, :image, :category, :meal_category)
  end


end
