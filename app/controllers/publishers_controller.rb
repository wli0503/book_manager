class PublishersController < ApplicationController

  before_filter :find_publisher_by_id, :only => [:show, :edit, :update, :destroy]

  def new
    @publisher = Publisher.new
  end

  def create
    @publisher = Publisher.create params[:publisher]
  end

  def show
  end

  def index
    @publishers = Publisher.all
  end

  def edit
  end

  def update
    @publisher.update_attributes(params[:publisher])
  end

  def destroy
    @publisher.destroy
  end

  private

  def find_publisher_by_id
    @publisher = Publisher.find(params[:id])
  end
end
