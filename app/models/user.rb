class User < ActiveRecord::Base
  has_many :supplies
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
