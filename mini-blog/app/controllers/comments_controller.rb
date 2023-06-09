class CommentsController < ApplicationController
  before_action :set_comment, only: %i[show update destroy]
  before_action :authenticate_user!, except: %i[index show]

  def index
    comments = Comments::List.new(params).execute
    render json: comments, meta: pagination(comments), each_serializer: CommentSerializer, status: :ok
  end

  def create
    @comment = authorize Comments::Create.new(comment_params, current_user).execute

    render json: @comment, serializer: CommentSerializer, status: :created
  end

  def update
    authorize @comment
    Comments::Update.new(comment_params, @comment).execute
    render json: @comment, serializer: CommentSerializer, status: :accepted
  end

  def destroy
    authorize Comments::Destroy.new(@comment).execute
    head :ok
  end

  private

  def set_comment
    @comment = Comment.find(params[:id])
    authorize @comment
  end

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
