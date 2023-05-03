class Categories::Update
  attr_accessor :params, :category

  def initialize(params, category)
    @params = params
    @category = category
  end

  def execute
    category.update!(mount_params)
  end

  private

  def mount_params
    {
      name: params[:name]
    }
  end
end
