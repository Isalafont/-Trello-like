# frozen_string_literal: true

class CreateProfiles < ActiveRecord::Migration[6.1]
  def change
    create_table :profiles do |t|
      t.string :first_name
      t.string :last_name
      t.string :username
      t.string :city
      t.string :country
      t.text :bio
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
