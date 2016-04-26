class Question < ActiveRecord::Base
	# This is Sinatra! Remember to create a migration!
	has_many :answers, dependent: :destroy
	belongs_to :user
	validates :user_id, presence: true
	validates :question_title, presence: true
	validates :question_desc, presence: true
end
