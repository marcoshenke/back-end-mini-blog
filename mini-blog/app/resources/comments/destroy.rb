class Comments::Delete
  def execute
    Comment.delete!
  end
end
