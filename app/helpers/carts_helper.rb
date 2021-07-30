module CartsHelper

  def has_info?
    has  = UserContactInfo.find_by(user_id:current_user.id)
    return has  
  end
  
end
