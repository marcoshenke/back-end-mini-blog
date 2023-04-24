class KindUsers::List
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    KindUser.__search(params)
  end
end
