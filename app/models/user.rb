class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	validates :email, :format => {:with => /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
	# validates :encrypted_password, :format => {:with => /\S{8,}/}

	include BCrypt

	def password=(new_password)
		@password = Password.create(new_password)
		self.encrypted_password = @password
	end

end
