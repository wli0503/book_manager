class GenresController < ApplicationController
  before_filter :find_genre_by_id, :only => [:edit, :update, :show, :destroy]

  def new
    @genre = Genre.new
  end

  def create
    Genre.create!(params[:genre])
    redirect_to genres_path
  end

  def edit
  end

  def update
    if @genre.update_attributes(params[:genre])
      redirect_to genre_path
    else
      render 'edit'
    end
  end

  def show
  end

  def index
    @genres = Genre.all
  end

  def destroy
    @genre.destroy
    redirect_to genres_path
  end

  private

  def find_genre_by_id
    @genre = Genre.find(params[:id])
  end

end
