class User < ActiveRecord::Base
  has_many :movies
  # has_secure_password

  validates :name, :email, presence: true
end