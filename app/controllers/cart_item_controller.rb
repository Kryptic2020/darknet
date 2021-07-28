class CartItemController < ApplicationController
  def index
  user_id = current_user.id
  
  end

  def create
  end

  def show
  @cart_item = CartItem.find(params[:id])
  @product = @cart_item.product
  end

  # GET /carts/1/edit
  def edit
   @cart_item = CartItem.find(params[:id])
   @product = @cart_item.product
  end

  def update
    quantity = params[:quantity].to_i
    @cart_item = CartItem.find(params[:id])
    @product = @cart_item.product
    if quantity > @product.quantity_available
      redirect_to cart_path(@cart_item.cart_id), alert: "Not Updated!!! Quantity not available, please try less"
    else
      price = quantity * @product.price
      updated_item = @cart_item.update(quantity:quantity, price:price)   
      redirect_to cart_path(@cart_item.cart_id), notice: "Updated"
    end
  end

  def destroy
  del = CartItem.destroy_by(id:params[:id])
  redirect_to cart_path(del[0].cart_id), notice: "Updated"
  end
end
