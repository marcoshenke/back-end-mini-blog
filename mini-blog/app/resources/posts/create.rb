class Posts::Create
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Post.create!(mount_params)
  end

  private

  def mount_params
    {
      title: params[:title],
      description: params[:description],
      category_id: params[:category_id],
      user_id: params[:user_id]
    }
  end
end
