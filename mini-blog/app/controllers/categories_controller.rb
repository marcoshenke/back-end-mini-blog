class CategoriesController < ApplicationController
  before_action :set_category, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]

  # GET /categories
  def index
    @categories = Categories::List.new(params).execute

    render json: @categories
  end

  # GET /categories/1
  def show
    render json: @category
  end

  # POST /categories
  def create
    authorize @category = Categories::Create.new(category_params).execute

    if @category.save
      render json: @category, serializer: CategorySerializer, status: :created,
             notice: 'Category was successfully created.'
    else
      render :new, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /categories/1
  def update
    if @category = Categories::Update.new(category_params).execute
      redirect_to @category, notice: 'Category was successfully updated.'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  # DELETE /categories/1
  def destroy
    @category
      .redirect_to categories_url, notice: 'Category was successfully destroyed.'
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
