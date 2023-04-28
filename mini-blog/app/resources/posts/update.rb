class Posts::Update
  attr_accessor :params, :post

  def initialize(params, post)
    @params = params
    @post = post
  end

  def execute
    post.update!(mount_params)
  end

  private

  def mount_params
    {
      title: params[:title] || post.title,
      description: params[:description] || post.description,
      category_id: params[:category_id] || post.category_id
    }
  end
end
