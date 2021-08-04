class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite]
  before_action :set_cart_item, only: [:show]
 
 


  def test
    if current_user
      @user = User.find(current_user.id)
      p "------------------------------xzz"
      p 
     #UserMailer.with(user: @user).welcome_email.deliver_now
      UserMailer.welcome_email(@user).deliver
       
          
    end
  end

  def listing
    
    @categories = Category.all
    
    p "hello----"
    p params[:search]
    @products = Product.search(params[:search],params[:category],params[:filter])
    
    #@products = Product.search(params[:search],params[:category],params[:filter])
    # @categories = Category.all
    # @products = Product.order(price: :asc)
    # p "-----------------------------hello----"
    # p @products
    # if params[:category] != ""
    #   category = params[:category]
    # end
    # if params[:search] != ""
    #   title = params[:search]
    # end
    # if category && title
    #   @title = Product.where(Product.arel_table[:title].matches("%#{title}%"))
    #   @products = []
    #   @title.each do |cat|       
    #     if cat.category_id.to_s == category
    #     @product << cat
    #     end
    #   end
    # elsif category &&!title
    #   @products = Product.where(category:category)
    # elsif !category && title
    #   @products = Product.where(Product.arel_table[:title].matches("%#{title}%"))
    # else
    # @products = Product.order(price: :desc)
    # end    
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
