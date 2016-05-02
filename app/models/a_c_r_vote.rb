class ACRVote < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	self.table_name = "a_c_r_votes"
	belongs_to :a_c_reply
	belongs_to :user
	validates :user_id, presence: :true
	validates :a_c_r_id, presence: :true
	validates :upvote, presence: :true
end
