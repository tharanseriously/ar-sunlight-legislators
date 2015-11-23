require_relative '../config'

class CreateLegislators < ActiveRecord::Migration
	def change
		create_table :legislators do |t|
			t.string :title
			t.string :firstname
			t.string :lastname
			t.string :party
			t.string :state
			t.string :gender
			t.date :birthdate
			t.integer :in_office
			t.string :phone
			t.string :fax
			t.string :website
			t.string :webform
			t.string :twitter_id
			t.timestamps null: false
		end
	end
end