class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # Show products - products GET    /products
  def index
    @products = Product.where(user_id:current_user.id)
  end

  # Show product - product GET    /products/:id
  def show
  end

  # Serve html with an instance class - new_product GET    /products/new
  def new
    @product = Product.new
  end

  # Fetch and serve html with the product - edit_product GET    /products/:id/edit
  def edit
  end

  # Receive params form HTML and create a product - POST   /products
  def create
    @product = Product.new(product_params)
    @product.user_id = current_user.id
    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: "Product was successfully created." }
        format.json { render :show, status: :created, location: @product }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # Receive params from html and update product -  PATCH/PUT /products/1 or /products/1.json
  def update
    respond_to do |format|
      if @product.update(product_params)
        format.html { redirect_to @product, notice: "Product was successfully updated." }
        format.json { render :show, status: :ok, location: @product }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1 or /products/1.json
  def destroy
    @product.destroy
    respond_to do |format|
      format.html { redirect_to products_url, notice: "Product was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # Send products and message info to dasboard html - dashboard GET    /dashboard
  def dashboard
    @prod_performance = Product.where(user_id:current_user.id) 
    # Fetching message with eagle-loading on a method at message model  
    @message_full = Message.get_my_messages(current_user.id) 
    # Getting only last message of each buyer to be displayed on dasboard inbox
    @message_list = @message_full.reverse.uniq { |f| [ f.user_id, f.product_id ] } 
  end
  
  # Fetch product(seller)&user(buyer) messages and send to HTML - get_message GET    /dashboard/message/:p/:u
  def show_message     
     @messages = Message.where(product_id:params[:p],user_id:params[:u]).order(created_at: :asc)
  end

  # Receive params from html and Post message - send_message_post POST   /dashboard/send-message
  def send_message
    message = "#{current_user.username}:  #{params[:message]}"
    my_message = Message.create(muted:true, user_id:params[:user_id], product_id:params[:product_id], message:message)          
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def product_params
      params.require(:product).permit(:condition_id, :title, :description, :price, :shipped_from, :delivery_estimated, :quantity_available, :sold, :user_id, :category_id, :picture)
    end
end
