class SubgenresController < ApplicationController

  before_filter :find_subgenre_by_id, :only => [:show, :edit, :update, :destroy]

  def new
    @subgenre = Subgenre.new
  end

  def create
    Subgenre.create!(params[:subgenre])
    redirect_to subgenres_path
  end

  def show
  end

  def index
    @subgenres = Subgenre.all
  end

  def edit
  end

  def update
    if @subgenre.update_attributes(params[:subgenre])
      redirect_to @subgenre
    else
      render 'edit'
    end
  end

  def destroy
    @subgenre.destroy!
    redirect_to subgenres_path
  end

  private

  def find_subgenre_by_id
    @subgenre = Subgenre.find(params[:id])
  end

end
