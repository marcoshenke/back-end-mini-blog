class CommentsController < ApplicationController
  before_action :set_comment, only: %i[update destroy]
  before_action :authenticate_user!

  def create
    @comment = authorize Comments::Create.new(comment_params, current_user).execute

    render json: @comment, serializer: CommentSerializer, status: :created
  end

  def update
    @comment = Comments::Update.new(comment_params).execute
    render json: @comment, serializer: CommentSerializer, status: :updated_at
  end

  def destroy
    authorize Comment::Destroy.new(@comment).execute
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
