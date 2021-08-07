class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite]
 
  # Send @Categories and @Products to HTML,  - listing GET  /listing
  def listing    
    @categories = Category.all 
    # Fetching Products with eagle loading, method search at product model       
    @products = Product.search(params[:search],params[:category],params[:filter])
  end
 
  #send @Product to HTML - see_product GET  /buyer/product/:id
  def show
    @product = Product.find(params[:id]) 
    # Saving path to redirect back after login, if not logged, return method at devise login method 
    session[:return_to] = request.env['PATH_INFO']     
  end
  
  # Receive params from HTML and Save product to favorite - add_favorite POST /listing/:id
  def add_favorite
    favorite = Favorite.find_by(product_id:params[:id],user_id:current_user.id)
    Favorite.create!(product_id:params[:id],user_id:current_user.id) if !favorite
  end 
  
end
