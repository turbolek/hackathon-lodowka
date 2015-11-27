class SuppliesController < ApplicationController


  def add_to_fridge
    @supply = Supply.new(supply_params)
   if @supply.save
    redirect_to(products_path)
     end
  end

  private

  def supply_params
    params.permit(:product_id, :fridge_id)
  end

end
