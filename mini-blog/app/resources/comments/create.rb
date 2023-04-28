class Comments::Create
  attr_accessor :params, :post_id

  def initialize(params)
    @params = params
    @post_id = find_post!
  end

  def execute
    Comment.create!(mount_params)
  end

  private

  def find_post!
    Post.find(params[:post_id])
  end

  def mount_params
    {
      comment: params[:comment],
      post_id: params[post_id]
    }
  end
end
