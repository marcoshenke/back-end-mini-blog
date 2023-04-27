class KindUsers::Update
  attr_accessor :params

  def initialize(params)
    @params = params
  end

  def execute
    KindUser.update!(mount_params)
  end

  private

  def mount_params
    {
      kind: params[:kind]
    }
  end
end
