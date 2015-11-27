class FridgesController < ApplicationController

  def index
  	@fridges = Fridge.all
    @given_product = Product.find(params[:product_id]) if params[:product_id]

  end

end
