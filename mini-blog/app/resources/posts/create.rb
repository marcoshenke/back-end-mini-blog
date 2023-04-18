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
      description: params[:description]
    }
  end
end
