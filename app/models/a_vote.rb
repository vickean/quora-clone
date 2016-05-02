class AVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :answer
	belongs_to :user
	validates :user_id, presence: :true
	validates :answer_id, presence: :true
	validates :upvote, presence: :true
end
