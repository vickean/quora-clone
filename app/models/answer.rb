class Answer < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	belongs_to :user
	belongs_to :question
	has_many :a_comments, dependent: :destroy
	has_many :a_votes, dependent: :destroy
	validates :question_id, presence: true
	validates :user_id, presence: true
	validates :answer_content, presence: true
end
