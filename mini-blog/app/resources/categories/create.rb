class Categories::Create
  attr_accessor :params, :post

  def initialize(params)
    @params = params
    @post = find_post!
  end

  def execute
    Category.create!(mount_params)
  end

  private

  def find_post!
    Category.find(params[:post_id])
  end

  def mount_params
    {
      name: params[:name]
    }
  end
end
