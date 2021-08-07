class PaymentController < ApplicationController  
  skip_before_action :verify_authenticity_token, only: [:webhook]
  
  # Fetch @cart and send to HTML - payment_success GET  /payment/success
  def success 
    cart_id = params[:cartId] 
    @cart = Cart.find(cart_id) 
  end
  
  #From Stripe call back
  def webhook   
    #Receive call back from Stripe API with payment intent; 
    payment_id = params[:data][:object][:payment_intent]    
    
    # Retrieve payment information from Stripe API;
    payment = Stripe::PaymentIntent.retrieve(payment_id)    
    @authorization = payment.charges.data[0].outcome.type

    # If payment succeed, update product, update cart, send email with receipt to User, redirect to success page.
    if @authorization && @authorization == "authorized" 
      @receipt = payment.charges.data[0].receipt_url
      cart_id = payment.metadata.cart_id
      user_id = payment.metadata.user_id
      user = User.find(user_id)
      cart = Cart.find(cart_id)       
      update_sold(cart)
      cart.payment.update(receipt_url:@receipt,payment_intent_id:payment_id)
      status = Status.last
      cart.update(status:status) 
      UserMailer.receipt_email(user, @receipt, cart).deliver
      render plain: "Success"
    else
    #If payment failed, redirect user
      redirect_to root_path, notice: "Your Payment has been #{@authorization}, please try again later"
    end     
  end

  # Helper 
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
