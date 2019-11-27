class LineItemsController < ApplicationController
  before_action :set_line_item, only: [:show, :edit, :update, :destroy]

  def index
    @line_items = LineItem.all
    render :json => @line_items, :include => [:product, :order]
  end

  def show
  end

  def edit
  end

  def new
    @line_item = LineItem.new
  end

  def create
    @line_item = LineItem.new(line_item_params)


    respond_to do |format|
      if @line_item.save
        format.html { redirect_to @line_item, notice: 'Line_item was successfully created.' }
        format.json { render :show, status: :created, location: @line_item }
      else
        format.html { render :new }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def update


    respond_to do |format|
      if @line_item.update(line_item_params)
        format.html { redirect_to @line_item, notice: 'Line_item was successfully updated.' }
        format.json { render :show, status: :ok, location: @line_item }
      else
        format.html { render :edit }
        format.json { render json: @line_item.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @line_item.destroy
    respond_to do |format|
      format.html { redirect_to line_items_url, notice: 'Line_item was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private

  def set_line_item
    @line_item = LineItem.find(params[:id])
  end

  def line_item_params
    params.require(:line_item).permit(:product_id, :quantity, :order_id)
  end

end
