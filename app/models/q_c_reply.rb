class QCReply < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	self.table_name = "q_c_replies"
	has_many :q_c_r_votes, dependent: :destroy
	belongs_to :user
	belongs_to :q_comment
	validates :user_id, presence: true
	validates :q_c_id, presence: :true
	validates :reply_content, presence: :true
end
