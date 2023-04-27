class Posts::Update
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Post.update!(mount_params)
  end

  private

  def mount_params
    {
      title: params[:title],
      description: params[:description]
    }
  end
end
