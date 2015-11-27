class User < ActiveRecord::Base
  has_many :supplies
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :memberships, :dependent => :destroy
  has_many :fridges, through: :memberships

end
