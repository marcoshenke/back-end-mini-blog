class Comments::Destroy
  attr_accessor :comment

  def initialize(comment)
    @comment = comment
  end

  def execute
    comment.destroy!
  end
end
