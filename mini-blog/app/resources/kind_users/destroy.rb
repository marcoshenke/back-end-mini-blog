class KindUsers::Delete
  def execute
    KindUser.delete!
  end
end
