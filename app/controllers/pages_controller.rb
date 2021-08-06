class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite]
  before_action :set_cart_item, only: [:show]
 
 


  def test
    
  end

  def listing    
    @categories = Category.all        
    @products = Product.search(params[:search],params[:category],params[:filter])

    @message = Message.new
    @messages = "hello"
p "---------------- noisss--------------------"

  end

  def show
    @product = Product.find(params[:id])    
    @cart_item = @product.cart_items.new
     session[:return_to] = request.env['PATH_INFO']     
  end

  def add_favorite
    product_id = params[:id]
    favorite = Favorite.find_by(product_id:product_id,user_id:current_user.id)
    Favorite.create!(product_id:product_id,user_id:current_user.id) if !favorite
    #flash[:notice] = "Saved to Favorites"
  end

  def restricted
  end 

  def send_message
    
  end

  def set_cart_item
  
    
  end

  def message_params

  param.require(:message).permit(:message)
    
  end
   
  
end
