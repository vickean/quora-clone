class CreateTables < ActiveRecord::Migration
	def change
		create_table :users do |x|
			x.string :email
			x.string :username
			x.string :encrypted_password
			x.datetime :created_at
			x.datetime :updated_at
		end

		create_table :questions do |y|
			y.integer :user_id
			y.string :question_title
			y.text :question_desc
			y.datetime :created_at
			y.datetime :updated_at
		end

		create_table :answers do |z|
			z.integer :question_id
			z.integer :user_id
			z.text :answer_content
			z.datetime :created_at
			z.datetime :updated_at
		end

	end
end
