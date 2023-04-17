class Posts::List
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Post.__search(params)
  end
end
