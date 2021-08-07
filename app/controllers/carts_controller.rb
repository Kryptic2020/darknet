class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :update_cart_total_amount
  skip_before_action :verify_authenticity_token, only: [:show, :create]

  # Send @carts to HTML - carts GET    /carts
  def index
    @carts = Cart.where(user:current_user.id)
  end

  # Send @carts to HTML - cart GET    /carts/:id
  def show
    @cart_items = CartItem.where(cart_id:params[:id])
    @cart = Cart.find(params[:id])    
  end

  # Receive params from HTML and create a cart - POST /carts or /carts.json
  def create
    #get resorces
    status = Status.first
    user = User.find(current_user.id)
    @my_cart = Cart.find_by(user:user, status:status)
    quantity = params[:quantity].to_i
    product = Product.find(params[:product_id].to_i)

    # verify if purchase quantity is higher than product quantity available
    if quantity > product.quantity_available
      redirect_to see_product_path(params[:product_id].to_i), alert: "Action Denied!!! Quantity not available, please try less"
    else
    #if there is not a cart, create a cart, then create cart items
    price = quantity * product.price    
    if !@my_cart     
      payment = Payment.new            
      @my_cart = Cart.create!(payment:payment, status:status, user:user)
      cart_item = CartItem.create!(cart:@my_cart, product:product, quantity:quantity, price:price)        
    else 
    #if there is a cart, then create cart items     
      cart_item = CartItem.create!(cart_id:@my_cart.id, product:product, quantity:quantity, price:price)
      prices = CartItem.where(cart_id:@my_cart.id)      
    end 
    #redirect path to show action   
    if params[:path_mycart] == "true"
      redirect_to cart_path(@my_cart.id)

    #redirect path to listing action - page controller
    elsif params[:path_home] == "true"
      redirect_to listing_path, notice: "Added to cart!"
    end 
 
    #Update product Sold and available
    sold = product.sold + quantity
    available = product.quantity_available - quantity
    updated = product.update(sold:sold, quantity_available:available)
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
    Cart.destroy_by(id:params[:id])
    redirect_to carts_path, notice: "Deleted"
  end
  
  private

  # Update cart total amount before loading carts
  def update_cart_total_amount
    cart = get_cart
    if cart
      cart_items = CartItem.where(cart_id:cart.id)        
      @total_amount = 0
      cart_items.each do |x|
        @total_amount = @total_amount + x.price
      end
      cart.update(total_amount:@total_amount)
    end  
  end    

  # Get cart with status "Open", if any
  def get_cart
    status = Status.first
    user = User.find(current_user.id)
    my_cart = Cart.find_by(user:user, status:status)
    return my_cart        
  end
end
