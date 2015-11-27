class FridgesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @fridge = Fridge.find(params[:id])
  end

  def new
    @fridge = Fridge.new
  end

  def create
    @fridge = Fridge.new(fridge_params)
    if @fridge.save
      redirect_to @fridge
    else
      render 'new'
    end
  end

  def index
  	@fridges = Fridge.all
  end

  def add_fridge
    @fridge = Fridge.find(params[:fridge_id])
    @fridge.users << current_user
    redirect_to fridges_path
  end

  private

  def fridge_params
    params.require(:fridge).permit(:name)
  end

end
