class PagesController < ApplicationController
  before_action :authenticate_user!, only: [:restricted]  

  def home
    @categories = Category.all
    @product = Product.all
    if params[:category] != ""
      category = params[:category]
    end
    if params[:search] != ""
      title = params[:search]
    end

    if category && title
      @title = Product.where(Product.arel_table[:title].matches("%#{title}%"))
      @product = []
      @title.each do |cat|       
        if cat.category_id.to_s == category
        @product << cat
        end
      end
    elsif category &&!title
      @product = Product.where(category:category)
    elsif !category && title
      @product = Product.where(Product.arel_table[:title].matches("%#{title}%"))
    else
    @product = Product.all
    end    
  end

  def restricted
  end 
   
  
end
