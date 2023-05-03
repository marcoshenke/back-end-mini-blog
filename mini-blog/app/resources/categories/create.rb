class Categories::Create
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Category.create!(mount_params)
  end

  private

  def mount_params
    {
      name: params[:name]
    }
  end
end
