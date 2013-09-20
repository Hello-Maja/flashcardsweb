class User < ActiveRecord::Base
  has_many :rounds
  validates :email, :uniqueness => :true
  validates :password_digest, :presence => :true
end
