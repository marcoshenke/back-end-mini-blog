class Posts::Create
  attr_accessor :params, :user

  def initialize(params, user)
    @params = params
    @user = user
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
      user: user
    }
  end
end
