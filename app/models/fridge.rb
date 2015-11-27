class Fridge < ActiveRecord::Base

  has_many :memberships, :dependent => :destroy
  has_many :users, through: :memberships

  has_many :supplies
  validates :name, presence: true
  
end
