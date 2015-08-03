class BooksController < ApplicationController

  before_filter :find_book_by_id, :only => [:edit, :update, :show, :destroy]

  def new
    @book = Book.new
  end

  def create
    @book = Book.create params[:book]
  end

  def edit
  end

  def update
    @book.update_attributes(params[:book])
  end

  def show
  end

  def destroy
    @book.destroy
  end

  def index
    @books = Book.all
  end


  private

  def find_book_by_id
    @book = Book.find(params[:id])
  end


end
