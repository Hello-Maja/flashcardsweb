require 'bcrypt'

class User < ActiveRecord::Base
  include BCrypt
  
  has_many :rounds
  validates :email, :uniqueness => :true
  validates :password_digest, :presence => :true

  def password
    @password ||= Password.new(password_digest)
  end

  def password=(new_password)
    @password = Password.create(new_password)
    self.password_digest = @password
  end

  def login
    @user = User.find_by_email(params[:email])
    if @user.password == params[:password]
      session[:id] == @user.id 
      redirect "/profile/#{session[:id]}"
    else
      redirect "/"
    end
  end

end
