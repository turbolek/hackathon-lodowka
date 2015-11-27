class SuppliesController < ApplicationController


  def add_to_fridge
    @supply = Supply.new(supply_params)
   if @supply.save
    redirect_to(products_path)
     end
  end

  def remove_supply
    Supply.find(params[:supply_id]).destroy
    redirect_to(fridge_path(params[:fridge_id]))
  end

  private

  def supply_params
    params.permit(:product_id, :fridge_id)
  end

end
