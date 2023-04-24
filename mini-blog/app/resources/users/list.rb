class Users::List
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    Users.__search(params)
  end
end
