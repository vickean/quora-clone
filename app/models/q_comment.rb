class QComment < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :q_c_replies, dependent: :destroy
	has_many :q_c_votes, dependent: :destroy
	belongs_to :question
	belongs_to :user
	validates :user_id, presence: true
	validates :question_id, presence: :true
	validates :comment_content, presence: :true
end
