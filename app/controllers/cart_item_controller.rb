class CartItemController < ApplicationController
  before_action :authenticate_user!

  # Send Cart item to Show page - cart_item_show GET    /cart_item/show/:id
  def show
  @cart_item = get_cart_item(params[:id])
  @product = @cart_item.product
  end

  # Send Cart item to Edit page - cart_item_edit GET    /cart_item/edit/:id
  def edit
   @cart_item = get_cart_item(params[:id])
   @product = @cart_item.product
  end
  
  #Receive input as params and Update Cart item - cart_item_update PUT   /cart_item/update/:id
  def update
    #getting data
    quantity = params[:quantity].to_i
    @cart_item = get_cart_item(params[:id])
    @product = @cart_item.product

    #validate purchase, quantity cannot exceed the available quantity 
    if quantity > @product.quantity_available
      redirect_to cart_path(@cart_item.cart_id), alert: "Not Updated!!! Quantity not available, please try less"
    else
    #Update cart item
      price = quantity * @product.price
      updated_item = @cart_item.update(quantity:quantity, price:price)   
      redirect_to cart_path(@cart_item.cart_id), notice: "Updated"
    end
  end

  # Delete cart item - cart_item_destroy DELETE /cart_item/destroy/:id
  def destroy
  del = CartItem.destroy_by(id:params[:id])
  redirect_to cart_path(del[0].cart_id), notice: "Updated"
  end

  # Query get cart item
  def get_cart_item(id)
    return CartItem.find(id)    
  end
end
