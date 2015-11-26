class Supply < ActiveRecord::Base
  belongs_to :fridge
  belongs_to :product
end
