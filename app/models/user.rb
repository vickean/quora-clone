class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	attr_accessor :password
	validates :email, uniqueness:true, presence: true, :format => {:with => /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
	validates :username, presence: true

	include BCrypt

	def password
    @password ||= Password.new(password_hash)
  end

	def password=(new_password)
		@password = Password.create(new_password)
		self.encrypted_password = @password
	end

	def self.authenticate(email, password)
		@user = self.find_by(email: email)
		@password = Password.new(@user.encrypted_password)
		if @password == password
			return @user
		else
			return false
		end
	end

end
