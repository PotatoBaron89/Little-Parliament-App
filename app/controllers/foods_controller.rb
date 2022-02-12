class FoodsController < ApplicationController
  before_action :check_permissions, only: %i[ create edit update destroy ]

  before_action :set_food, only: %i[ show edit update destroy ]
  # before_action :authenticate_user, except: %i[ show index ]

  # GET /foods or /foods.json
  def index
    @food = Food.all
    response = @food.map do |food|
      {
        food: {
        "title": food.title,
        "description": food.description,
        "price": food.price,
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
      "title": @food.title,
      "description": @food.description,
      "price": @food.price,
      "image": @food.image.url,
      "category": @food.category,
      "meal_category": @food.meal_category
    }
  end

  # GET /foods/new
  def new
    @food = Food.new
  end

  # GET /foods/1/edit
  def edit
  end

  # POST /foods or /foods.json
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

  # PATCH/PUT /foods/1 or /foods/1.json
  def update
    respond_to do |format|
      if @food.update(food_params)
        format.json { render :show, status: :ok, location: @food }
      else
        format.json { render json: @food.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /foods/1 or /foods/1.json
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
