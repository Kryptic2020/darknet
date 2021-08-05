class MessageController < ApplicationController

  def show 
    @product_id = params[:id]
    @messages = ["No messages to be displayed"]
    messages = Message.where(product_id:@product_id)
    if messages
      @messages = messages  
    end
    p @messages
  end

  def get  
  end

  def send_message
    message = "#{current_user.username}:  #{params[:message]}"
    Message.create!(user_id:current_user.id, product_id:params[:product_id], message:message)
    p params
  end

  def delete  
  end

  def update  
  end
end
