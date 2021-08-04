class PaymentController < ApplicationController
  skip_before_action :verify_authenticity_token, only: [:webhook]
  
  def success
  
    @cart = Cart.find(params[:cartId]) 
    p "-----------------------------test----------------"
    p @cart.payment
  end

  # def test
  #   p "-----------------------------test----------------"
  #   payment = Stripe::PaymentIntent.retrieve("pi_3JJE0yEe6AwIaPMz0oLYZ9wy")
  #   receipt = payment.charges.data[0].receipt_url
  #   authorization = payment.charges.data[0].outcome.type
  # end

  def webhook   
    payment_id = params[:data][:object][:payment_intent]
    payment = Stripe::PaymentIntent.retrieve(payment_id)
    @authorization = payment.charges.data[0].outcome.type
    @receipt = payment.charges.data[0].receipt_url
    cart_id = payment.metadata.cart_id
    user_id = payment.metadata.user_id
    user = User.find(user_id)
    cart = Cart.find(cart_id)
    if @authorization == "authorized"
    p = "-------------------authorized----------------------------"
      update_sold(cart)
      cart.payment.update(receipt_url:@receipt,payment_intent_id:payment_id)
      status = Status.last
      cart.update(status:status) 
      UserMailer.receipt_email(user, @receipt, cart).deliver
      render plain: "Success"
    else
      redirect_to root_path, notice: "Your Payment has been #{@authorization}, please try again later"
    end     
  end

  def update_sold(cart)    
    #Update product Sold and available
    cart.cart_items.each do |item|
    product = Product.find(item.product_id)
    sold = product.sold + item.quantity
    available = product.quantity_available - item.quantity
    updated = product.update(sold:sold, quantity_available:available)
    end
    
  end
end
