class AComment < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
	belongs_to :user
	has_many :a_c_replies, dependent: :destroy
	has_many :a_c_votes, dependent: :destroy
	validates :user_id, presence: :true
	validates :answer_id, presence: :true
	validates :comment_content, presence: :true
end
