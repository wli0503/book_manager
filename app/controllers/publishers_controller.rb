class PublishersController < ApplicationController

  before_filter :find_publisher_by_id, :only => [:show, :edit, :update, :destroy]

  def new
    @publisher = Publisher.new
  end

  def create
    Publisher.create params[:publisher]
    redirect_to publishers_path
  end

  def show
  end

  def index
    @publishers = Publisher.all
  end

  def edit
  end

  def update
    if @publisher.update_attributes(params[:publisher])
      redirect_to publishers_path
    else
      render 'edit'
    end
  end

  def destroy
    @publisher.destroy
    redirect_to publishers_path
  end

  private

  def find_publisher_by_id
    @publisher = Publisher.find(params[:id])
  end
end
