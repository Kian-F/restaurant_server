class OrdersController < ApplicationController
  before_action :set_order, only: [:show, :edit, :update, :destroy]


  def generate_order
    order = Order.new
    order.kind = params[:kind]
    order.total_price = params[:total_price]

    if params[:user_id].present?
      order.user_id = params[:user_id]
    else
      user = User.new
      user.orders << order
      user.name = params[:name]
      user.email = params[:email]
      user.phone_number = params[:phone_number]
      user.address = params[:address]
      user.save
    end

    orderItems = params[:orderItems]

    orderItems.each do |key, value|
      line_item = LineItem.new
      line_item.product_id = key
      line_item.quantity = value
      order.line_items << line_item
    end

    order.save

    render :json => order, :include => [:line_items, :user]
  end


  def index
    @orders = Order.all
    render :json => @orders, :include => [:user, :line_items]
  end

  def show

  end

  def edit
  end

  def new
    @order = Order.new
  end

  def create
    @order = Order.new(order_params)

    respond_to do |format|
      if @order.save
        format.html { redirect_to @order, notice: 'Order was successfully created.' }
        format.json { render :show, status: :created, location: @order }
      else
        format.html { render :new }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @order.update(order_params)
        format.html { redirect_to @order, notice: 'Order was successfully updated.' }
        format.json { render :show, status: :ok, location: @order }
      else
        format.html { render :edit }
        format.json { render json: @order.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @order.destroy
    respond_to do |format|
      format.html { redirect_to orders_url, notice: 'Order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_order
    @order = Order.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def order_params
    params.require(:order).permit(:user_id, :line_item_id, :product_id, :kind)
  end
end
