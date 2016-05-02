class ACVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	self.table_name = "a_c_votes"
	belongs_to :a_comment
	belongs_to :user
	validates :user_id, presence: :true
	validates :a_c_id, presence: :true
	validates :upvote, presence: :true
end
