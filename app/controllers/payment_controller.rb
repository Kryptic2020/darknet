class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  
  def success
    @cart = Cart.find(params[:cartId])
  end

  def webhook 
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    cart_id = payment.metadata.cart_id
    user_id = payment.metadata.user_id
    user = User.find(user_id)
    dish = Dish.find(dish_id)
    
    render plain: "Success"
  end
end
