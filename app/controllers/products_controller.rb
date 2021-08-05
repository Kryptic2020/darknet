class ProductsController < ApplicationController
  before_action :set_product, only: %i[ show edit update destroy ]
  before_action :authenticate_user!

  # GET /products or /products.json
  def index
    @products = Product.where(user_id:current_user.id)
  end

  # GET /products/1 or /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products or /products.json
  def create
  p params
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

  # PATCH/PUT /products/1 or /products/1.json
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

  def dashboard
  @message_list = Message.where(muted:false)
  end

  def show_message 
    @message_id = params[:id]
    m = Message.find(@message_id)
    @messages = ["No messages to be displayed"]
    messages = Message.where(product_id:m.product_id, user_id:m.user_id)
    if messages
      @messages = messages  
    end
    p @messages
  end

  def send_message
    message = "#{current_user.username}:  #{params[:message]}"
    my_message = Message.create(:muted => true, user_id:current_user.id, product_id:params[:product_id], message:message)    
       p "---------"
    p my_message.muted
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
