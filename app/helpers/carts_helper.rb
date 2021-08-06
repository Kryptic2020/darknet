module CartsHelper

  def has_info?
    has  = ShippingInfo.find_by(user_id:current_user.id)
    return has  
  end
  
end
