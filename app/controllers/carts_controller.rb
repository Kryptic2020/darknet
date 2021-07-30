class CartsController < ApplicationController
  before_action :authenticate_user!
  before_action :get_cart, only: [:create]

  # GET /carts or /carts.json
  def index
  user = current_user.id
    @carts = Cart.where(user:user)
    @cartitem = CartItem.all
    
  end

  # GET /carts/1 or /carts/1.json
  def show
    cart_id = params[:id]
    @cart_items = CartItem.where(cart_id:cart_id)
    @cart = Cart.find(cart_id)
    @total_amount = 0
    @cart_items.each do |x|
      @total_amount =  @total_amount + x.price
    end
    @cart.update(total_amount:@total_amount)
    
    names = @cart_items.map do |a|
    a.product.title
    end 
    names = names.uniq().split(",").join(",")
    
    descriptions = @cart_items.map do |a|
    a.product.description
    end 
    descriptions = descriptions.uniq().split(",").join(",")
    if user_signed_in?
    session = Stripe::Checkout::Session.create(
      payment_method_types: ['card'],
      customer_email: current_user.email,
      line_items: [{
        name: names,
        description: descriptions,
        images: ["https://images.unsplash.com/photo-1595367189327-391b72c90283?ixid=MnwxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8&ixlib=rb-1.2.1&auto=format&fit=crop&w=1950&q=80"],
        amount: (@cart.total_amount * 100).to_i,
        currency: "aud",
        quantity: 1,
      }],
      payment_intent_data: {
        metadata: {
          cart_id: @cart.id,
          user_id: @current_user.id
        }
      },
      success_url: "#{root_url}payment/success?userId=#{@current_user.id}&cartId=#{@cart.id}",
      cancel_url: "#{root_url}carts"
    )
    @session_id = session.id
    end

  end

  # GET /carts/new
  def new
    
  end

  # GET /carts/1/edit
  def edit
  end

  # POST /carts or /carts.json
  def create
    status = Status.first
    user = User.find(current_user.id)
    @my_cart = Cart.where(user:user, status:status) 
    user = User.find(current_user.id)
    product_id = params[:product_id].to_i
    quantity = params[:quantity].to_i
    product = Product.find(product_id)
     if quantity > product.quantity_available
      redirect_to see_product_path(product_id), alert: "Action Denied!!! Quantity not available, please try less"
    else
    price = quantity * product.price    
    if @my_cart.length == 0     
      payment = Payment.new            
      @my_cart = Cart.create!(payment:payment, status:status, user:user)
      cart_item = CartItem.create!(cart:@my_cart, product:product, quantity:quantity, price:price)        
    else
      @my_cart = @my_cart[0]
      cart_item = CartItem.create!(cart_id:@my_cart.id, product:product, quantity:quantity, price:price)
      prices = CartItem.where(cart_id:@my_cart.id)      
    end     
    if params[:path_mycart] == "true"
      redirect_to cart_path(@my_cart.id)
    elsif params[:path_home] == "true"
      redirect_to root_path, notice: "Added to cart!"
    end 
    #Update product Sold and available
    sold = product.sold + quantity
    available = product.quantity_available - quantity
    updated = product.update(sold:sold, quantity_available:available)
    end
  end

  # PATCH/PUT /carts/1 or /carts/1.json
  def update
    respond_to do |format|
      if @cart.update(cart_params)
        format.html { redirect_to @cart, notice: "Cart was successfully updated." }
        format.json { render :show, status: :ok, location: @cart }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @cart.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /carts/1 or /carts/1.json
  def destroy
   id = params[:id]
   Cart.destroy_by(id:id)
   p params[:id]
   redirect_to carts_path, notice: "Deleted"

  end

  private


    def get_cart
      
    end
end
