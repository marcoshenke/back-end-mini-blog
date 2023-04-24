class Posts::Delete
  def execute
    Post.delete!
  end
end
