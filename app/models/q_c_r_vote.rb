class QCRVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	self.table_name = "q_c_r_votes"
	belongs_to :q_c_reply
	belongs_to :user
	validates :user_id, presence: true
	validates :q_c_r_id, presence: :true
	validates :upvote, presence: :true
end
