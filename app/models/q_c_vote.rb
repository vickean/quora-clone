class QCVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	self.table_name = "q_c_votes"
	belongs_to :q_comment
	belongs_to :user
	validates :user_id, presence: true
	validates :q_c_id, presence: :true
	validates :upvote, presence: :true
end
