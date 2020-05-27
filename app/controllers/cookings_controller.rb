class CookingsController < ApplicationController

  def index
    @cooking = Cooking.all.order(created_at: "DESC")
  end

  def new
    @cooking = Cooking.new
  end

  def create
    cooking = Cooking.create(cooking_params)
    redirect_to cookings_path
  end

  def show
    @cooking = Cooking.find(params[:id])
  end

  def edit
    @cooking = Cooking.find(params[:id])
    
  end

  def update
    @cooking = Cooking.find(params[:id])
    @cooking.update(cooking_params)
    redirect_to cookings_path
  end

  def destroy
    cooking = Cooking.find(params[:id])
    cooking.destroy
    redirect_to cookings_path
  end
  
  private
  def cooking_params
    params.require(:cooking).permit(:title, :image)
  end
end
