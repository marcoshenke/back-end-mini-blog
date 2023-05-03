class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /categories
  def index
    @categories = Categories::List.new(params).execute
    render json: @categories, status: :ok
  end

  # GET /categories/1
  def show
    authorize @category
    render json: @category, serializer: CategorySerializer, list_posts: true
  end

  # POST /categories
  def create
    authorize @category = Categories::Create.new(category_params).execute

    if @category.save
      render json: @category, serializer: CategorySerializer, status: :created
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    authorize @category
    Categories::Update.new(category_params, @category).execute
    render json: @category, serializer: CategorySerializer, status: :accepted
  end

  # DELETE /categories/1
  def destroy
    authorize Categories::Destroy.new(@category).execute
    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_category
    @category = Category.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def category_params
    params.require(:category).permit(:name)
  end
end
