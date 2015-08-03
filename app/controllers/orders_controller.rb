class OrdersController < ApplicationController

  before_filter :find_order_by_id, :only => [:edit, :show, :destroy]

  def new
    @order = Order.new;
  end

  def create
    @order = Order.create params[:order]
  end

  def edit
  end

  def update
    @order.update_attributes(params[:order])
  end

  def show
  end

  def index
    @orders = Order.all
  end

  def destroy
    @order.destroy;
  end

  private

  def find_order_by_id
    @order = Order.find(params[:id])
  end
end
