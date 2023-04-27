class CommentsController < ApplicationController
  before_action :authenticate_user!

  def create
    @comment = Comments::Create.new(comment_params).execute

    render json: @comment, serializer: CommentSerializer, status: :created
  end

  def update
    @comment = Comments::Update.new(comment_params).execute
    render json: @comment, serializer: CommentSerializer, status: :created
  end

  private

  # Only allow a list of trusted parameters through.
  def comment_params
    params.require(:comment).permit(:comment, :post_id)
  end
end
