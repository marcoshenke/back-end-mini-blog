class Posts::Destroy
  attr_accessor :post

  def initialize(post)
    @post = post
  end

  def execute
    post.destroy!
  end
end
