class UserContactInfoController < ApplicationController
  before_action :authenticate_user!  
  before_action :my_cart
  before_action :verify_authenticity_token, only: [:show]

  def my_cart
    status = Status.first
    cart = Cart.find_by(user_id:current_user.id, status:status)
    return cart.id
  end

  def show
    @user_contact_info = UserContactInfo.find_by(user_id:current_user.id)
    @cart = my_cart
    cart_id = my_cart
    @cart_items = CartItem.where(cart_id:cart_id)
    @cart = Cart.find(cart_id)
    names = @cart_items.map do |a|
    a.product.title
    end 
    names = names.uniq().split(",").join(",")
    
    descriptions = @cart_items.map do |a|
    a.product.description
    end 
    descriptions = descriptions.uniq().split(",").join(",")
    if user_signed_in?
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: names,
        description: descriptions,
        images: ["https://images.unsplash.com/photo-1595367189327-391b72c90283?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"],
        amount: (@cart.total_amount * 100).to_i,
        currency: "aud",
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          cart_id: @cart.id,
          user_id: @current_user.id
        }
      },
      success_url: "#{root_url}payment/success?userId=#{@current_user.id}&cartId=#{@cart.id}",
      cancel_url: "#{root_url}carts"
    )
    @session_id = session.id
    end
  end

  def new
    @user_contact_info = UserContactInfo.new    
  end

  def edit
    @user_contact_info = UserContactInfo.find_by(user_id:current_user.id)
  end  

  def update
    update = UserContactInfo.find_by(user_id:current_user.id)
    p "----------here ------------"
    p session
    p update
    p user_contact_info_params
    update.update(user_contact_info_params)
    redirect_to user_contact_info_path
  end

  def create
    user = User.find(current_user.id)
    info = UserContactInfo.new(user:user)
    info.update(user_contact_info_params)
    info.save    
    redirect_to user_contact_info_path(user.id)
  end

  private
  def user_contact_info_params
    params.require(:user_contact_info).permit(:unit,:street_number,:street_name,:suburb,:postcode,:phone) 
  end
end