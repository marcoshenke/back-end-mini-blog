class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    posts = Posts::List.new(params).execute
    render json: posts, meta: pagination(posts), each_serializer: PostSerializer, status: :ok
  end

  def show
    authorize @post
    render json: @post, serializer: PostSerializer, list_comments: true, status: :ok
  end

  def create
    @post = authorize Posts::Create.new(post_params, current_user).execute

    render json: @post, serializer: PostSerializer, status: :created
  end

  def update
    authorize @post
    Posts::Update.new(post_params, @post).execute
    render json: @post, serializer: PostSerializer, status: :ok
  end

  def destroy
    authorize Posts::Destroy.new(@post).execute
    head :ok
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
    authorize @post
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :category_id)
  end
end
