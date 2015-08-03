class SubgenresController < ApplicationController

  before_filter :find_subgenre_by_id, :only => [:show, :edit, :update, :destroy]

  def new
    @subgenre = Subgenre.new
  end

  def create
    @subgenre = Subgenre.create!(params[:subgenre])
  end

  def show
  end

  def index
    @subgenres = Subgenre.all
  end

  def edit
  end

  def update
    @subgenre.update_attributes(params[:subgenre])
  end

  def destroy
    @subgenre.destroy!
  end

  private

  def find_subgenre_by_id
    @subgenre = Subgenre.find(params[:id])
  end

end
