class CreateCards < ActiveRecord::Migration[6.0]
  def change
    create_table :cards do |t|
      t.references :list, null: false, foreign_key: true
      t.string :name
      t.integer :position

      t.timestamps
    end
  end
end
