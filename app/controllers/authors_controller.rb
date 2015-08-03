class AuthorsController < ApplicationController

  before_filter :find_author_by_id, :only => [:show, :edit, :update, :destroy]

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(params[:author])
  end

  def edit
  end

  def update
    @author.update_attributes(params[:author])
  end

  def show
  end

  def index
    @authors = Author.all
  end

  def destroy
    Author.destroy(params[:id])
  end

  private

  def find_author_by_id
    @author = Author.find(params[:id])
  end

end
