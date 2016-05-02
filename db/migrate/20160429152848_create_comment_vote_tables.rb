class CreateCommentVoteTables < ActiveRecord::Migration
	def change
		create_table :q_comments do |a|
			a.integer :user_id
			a.integer :question_id
			a.text :comment_content
			a.datetime :created_at
			a.datetime :updated_at
		end

		create_table :a_comments do |b|
			b.integer :user_id
			b.integer :answer_id
			b.text :comment_content
			b.datetime :created_at
			b.datetime :updated_at
		end

		create_table :q_c_replies do |c|
			c.integer :user_id
			c.integer :q_c_id
			c.text :reply_content
			c.datetime :created_at
			c.datetime :updated_at
		end

		create_table :a_c_replies do |d|
			d.integer :user_id
			d.integer :a_c_id
			d.text :reply_content
			d.datetime :created_at
			d.datetime :updated_at
		end

		create_table :q_votes do |e|
			e.integer :user_id
			e.integer :question_id
			e.boolean :upvote
			e.datetime :created_at
			e.datetime :updated_at
		end

		create_table :a_votes do |f|
			f.integer :user_id
			f.integer :answer_id
			f.boolean :upvote
			f.datetime :created_at
			f.datetime :updated_at
		end

		create_table :q_c_votes do |g|
			g.integer :user_id
			g.integer :q_c_id
			g.boolean :upvote
			g.datetime :created_at
			g.datetime :updated_at
		end

		create_table :a_c_votes do |h|
			h.integer :user_id
			h.integer :a_c_id
			h.boolean :upvote
			h.datetime :created_at
			h.datetime :updated_at
		end

		create_table :q_c_r_votes do |i|
			i.integer :user_id
			i.integer :q_c_r_id
			i.boolean :upvote
			i.datetime :created_at
			i.datetime :updated_at
		end

		create_table :a_c_r_votes do |j|
			j.integer :user_id
			j.integer :a_c_r_id
			j.boolean :upvote
			j.datetime :created_at
			j.datetime :updated_at
		end

	end
end
