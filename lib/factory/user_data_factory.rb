class UserDataFactory
  def get(current_user, type)
    if type.where("user_id = ?", [current_user.id]).count == 0
      ud = type.new
      ud.user = current_user
      ud.save
    end
    ud = type.where("user_id = ?", [current_user.id]).first
    return ud
  end
end
