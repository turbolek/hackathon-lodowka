class Fridge < ActiveRecord::Base

  has_many :memberships, dependent: :destroy
  has_many :users, through: :memberships

  has_many :supplies, dependent: :destroy
  has_many :products, through: :supplies
  validates :name, presence: true
  
end
