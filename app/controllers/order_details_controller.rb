class OrderDetailsController < ApplicationController

  before_filter :find_order_detail_by_id, :only => [:show, :destroy, :edit, :update]

  def new
    @order_detail = OrderDetail.new
    @order_id = params[:order_id]
  end

  def create
    params[:order_detail][:unit_price] = Book.find(params[:order_detail][:book_id]).price
    @order_detail = OrderDetail.create(params[:order_detail])
  end

  def edit
    @order_id = @order_detail.order_id
  end

  def update
    @order_detail.update_attributes(params[:order_detail])
  end

  def destroy
    @order_detail.destroy
  end

  def index
  end

  def show
  end

  private

  def find_order_detail_by_id
    @order_detail = OrderDetail.find(params[:id])
  end

end
