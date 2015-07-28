class BooksController < ApplicationController

  before_filter :find_book_by_id, :only => [:edit, :update, :show]

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
      redirect_to @book
    else
      render 'edit'
    end
  end

  def show
  end

  def destroy
    Book.destroy(params[:id])
    redirect_to books_path
  end

  def index
    @books = Book.all
  end


  private

  def find_book_by_id
    @book = Book.find(params[:id])
  end

end
