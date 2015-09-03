class User < ActiveRecord::Base
  # Remember to create a migration!
  has_many :posts
  has_many :comments

  validates :name, presence: true, uniqueness: {
  	message: "The username has already been taken!"
  }
  validates :email, presence: true, uniqueness: {
  	message: "The email has been registered to another account!"
  }
  validates :password, presence: true, length: {
  	minimum: 4,
  	maximum: 12,
  	message: "Password must be between 4 to 12 characters!"
  }

  def self.authenticate(name, password)
  	check = self.find_by name: name, password: password
  	if check == nil
  		false
  	else
  		true
  	end
  end
end