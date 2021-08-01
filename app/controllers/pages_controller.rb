class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:add_favorite]
  before_action :set_cart_item, only: [:show]

  def home
    @categories = Category.all
    @products = Product.all
    if params[:category] != ""
      category = params[:category]
    end
    if params[:search] != ""
      title = params[:search]
    end

    if category && title
      @title = Product.where(Product.arel_table[:title].matches("%#{title}%"))
      @products = []
      @title.each do |cat|       
        if cat.category_id.to_s == category
        @product << cat
        end
      end
    elsif category &&!title
      @products = Product.where(category:category)
    elsif !category && title
      @products = Product.where(Product.arel_table[:title].matches("%#{title}%"))
    else
    @products = Product.all
    end    
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
