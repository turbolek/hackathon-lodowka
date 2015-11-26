class SuppliesController < ApplicationController

  def new
    @supply = Supply.new
  end

  def create

  end

  private

  def supply_params
    params.require(:supply).permit(:name, :barcode)
  end

end
