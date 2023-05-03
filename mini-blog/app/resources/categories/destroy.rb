class Categories::Destroy
  attr_accessor :category

  def initialize(category)
    @category = category
  end

  def execute
    category.destroy!
  end
end
