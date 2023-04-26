class Categories::List
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Category.__search(params)
  end
end
