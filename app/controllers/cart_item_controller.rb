class CartItemController < ApplicationController
  def index
  user_id = current_user.id
  
  end

  def create
  end

  def show
  user_id = current_user.id
  @cart_items = CartItem.all
  end

  def update
  end

  def destroy
  end
end
