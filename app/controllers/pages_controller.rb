class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:restricted]  
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
     
  end

  def restricted
  end 

  def set_cart_item
  
    
  end
   
  
end
