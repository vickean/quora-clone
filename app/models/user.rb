class User < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	include BCrypt
	attr_accessor :password
	validates :email, uniqueness:true, presence: true, :format => {:with => /\A([\w+\-]\.?)+@[a-z\d\-]+(\.[a-z]+)*\.[a-z]+\z/}
	validates :username, presence: true

	has_many :questions
	has_many :answers
	has_many :q_comments
	has_many :a_comments
	has_many :q_c_replies
	has_many :a_c_replies
	has_many :q_votes, dependent: :destroy
	has_many :a_votes, dependent: :destroy
	has_many :q_c_votes, dependent: :destroy
	has_many :a_c_votes, dependent: :destroy
	has_many :q_c_r_votes, dependent: :destroy
	has_many :a_c_r_votes, dependent: :destroy

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
