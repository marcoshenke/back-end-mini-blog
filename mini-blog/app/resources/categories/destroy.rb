class Categories::Delete
  def execute
    Category.delete!
  end
end
