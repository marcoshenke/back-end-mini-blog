class Posts::Destroy
  def execute
    post.destroy!
  end
end
