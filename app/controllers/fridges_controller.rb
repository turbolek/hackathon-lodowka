class FridgesController < ApplicationController

  def index
  	@fridges = Fridge.all
  end

end
