class User < ActiveRecord::Base
  has_many :rounds
  validates :email, :uniqueness => :true
end
