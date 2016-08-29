class User < ActiveRecord::Base
  has_secure_password
  validates :username, uniqueness: true, presence: true
  validates :password, presence: true
  validates :email, uniqueness: true, presence: true 
  validates :phone_number, uniqueness: true, presence: true
end
