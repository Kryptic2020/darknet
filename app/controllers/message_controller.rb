class MessageController < ApplicationController
before_action :authenticate_user!

  # Send @messages to HTML - message_get GET  /message/get
  def show 
    # Send product_id to HTML show
    @product_id = params[:id]

    #Query messages that belongs to  product(seller) and user(buyer)
    messages = Message.where(product_id:@product_id, user_id:current_user.id)
    if messages
      @messages = messages 
    else 
      @messages = ["No messages to be displayed"]
    end
  end

  # Receive message from HTML and post - message_post POST /message
  def send_message
    message = "#{current_user.username}:  #{params[:message]}"
    Message.create!(user_id:current_user.id, product_id:params[:product_id], message:message, muted:false)
  end

end
