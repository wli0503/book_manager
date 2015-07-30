class BooksController < ApplicationController

  before_filter :find_book_by_id, :only => [:edit, :update, :show, :destroy]

  def new
    @book = Book.new
  end

  def create
    Book.create params[:book]
    redirect_to books_path
  end

  def edit
  end

  def update
    if @book.update_attributes(params[:book])
      redirect_to books_path
    else
      render 'edit'
    end
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
