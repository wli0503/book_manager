class AuthorsController < ApplicationController

  before_filter :find_author_by_id, :only => [:show, :edit, :update]

  def new
    @author = Author.new
  end

  def create
    @author = Author.create(params[:author])
    redirect_to @author
  end

  def edit
  end

  def update
    if @author.update_attributes(params[:author])
      redirect_to @author
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @authors = Author.all
  end

  def destroy
    Author.destroy(params[:id])
    redirect_to authors_path
  end

  private

  def find_author_by_id
    @author = Author.find(params[:id])
  end

end
