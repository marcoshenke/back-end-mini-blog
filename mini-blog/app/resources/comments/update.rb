class Comments::Update
  attr_accessor :params, :post

  def initialize(params)
    @params = params
    @post = find_post!
  end

  def execute
    Comment.update!(mount_params)
  end

  private

  def find_post!
    Post.find(params[:post_id])
  end

  def mount_params
    {
      comment: params[:comment],
      post: post
    }
  end
end
