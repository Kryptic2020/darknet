class MessageController < ApplicationController
before_action :authenticate_user!

  def show 
    @product_id = params[:id]
    @messages = ["No messages to be displayed"]
    messages = Message.where(product_id:@product_id, user_id:current_user.id)
    if messages
      @messages = messages 
    else 
      @messages = ["No messages to be displayed"]
    end
  end

  def get  
  end

  def send_message
    message = "#{current_user.username}:  #{params[:message]}"
    Message.create!(user_id:current_user.id, product_id:params[:product_id], message:message, muted:false)
    p params
  end

  def delete  
  end

  def update  
  end
end
