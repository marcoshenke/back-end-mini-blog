class Comments::List
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Comment.__search(params)
  end
end
