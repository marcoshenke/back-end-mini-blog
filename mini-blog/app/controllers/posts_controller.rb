class PostsController < ApplicationController
  before_action :set_post, only: %i[show update destroy]
  before_action :authenticate_user!

  def index
    posts = Posts::List.new(params).execute

    render json: posts, meta: pagination(posts), each_serializer: PostSerializer, status: :ok
  end

  def show
    render json: @post, serializer: PostSerializer, list_comments: true, status: :ok
  end

  def create
    @post = Posts::Create.new(post_params).execute

    render json: @post, serializer: PostSerializer, status: :created
  end

  def update
    @post.update!(post_params)

    render json: @post, serializer: PostSerializer, status: :ok
  end

  def destroy
    @post.destroy!

    head :no_content
  end

  private

  # Use callbacks to share common setup or constraints between actions.
  def set_post
    @post = Post.find(params[:id])
  end

  # Only allow a list of trusted parameters through.
  def post_params
    params.require(:post).permit(:title, :description, :category_id, :user_idx)
  end
end
