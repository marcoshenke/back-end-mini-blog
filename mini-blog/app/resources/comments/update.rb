class Comments::Update
  attr_accessor :params, :comment

  def initialize(params, comment)
    @params = params
    @comment = comment
  end

  def execute
    comment.update!(mount_params)
  end

  private

  def mount_params
    {
      comment: params[:comment],
      post_id: comment.post_id
    }
  end
end
