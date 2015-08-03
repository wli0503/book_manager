class GenresController < ApplicationController
  before_filter :find_genre_by_id, :only => [:edit, :update, :show, :destroy]

  def new
    @genre = Genre.new
  end

  def create
    @genre = Genre.create!(params[:genre])
  end

  def edit
  end

  def update
    @genre.update_attributes(params[:genre])
  end

  def show
  end

  def index
    @genres = Genre.all
  end

  def destroy
    @genre.destroy
  end

  private

  def find_genre_by_id
    @genre = Genre.find(params[:id])
  end

end
