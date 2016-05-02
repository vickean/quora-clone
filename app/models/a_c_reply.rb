class ACReply < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	self.table_name = "a_c_replies"
	belongs_to :a_comment
	belongs_to :user
	has_many :a_c_votes, dependent: :destroy
	validates :user_id, presence: :true
	validates :a_c_id, presence: :true
	validates :reply_content, presence: :true
end
