class Membership < ActiveRecord::Base
  belongs_to :fridge
  belongs_to :user
end
