class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite]
  before_action :set_cart_item, only: [:show]
 
 


  def test
    
  end

  def listing    
    @categories = Category.all        
    @products = Product.search(params[:search],params[:category],params[:filter])
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

  def set_cart_item
  
    
  end
   
  
end
