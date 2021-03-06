class FridgesController < ApplicationController
  before_action :authenticate_user!, except: [:index, :show]

  def show
    @fridge = Fridge.find(params[:id])
    @supplies = @fridge.supplies
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
    user = User.find_by(id: params[:user])
  	@fridges = user.try(:fridges) || Fridge.all
    @given_product = Product.find(params[:product_id]) if params[:product_id]

  end

  def add_fridge
    @fridge = Fridge.find(params[:fridge_id])
    @fridge.users << current_user
    redirect_to fridges_path(user: current_user)
  end


  private

  def fridge_params
    params.require(:fridge).permit(:name)
  end

end
