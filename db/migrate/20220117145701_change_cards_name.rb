class ChangeCardsName < ActiveRecord::Migration[6.1]
  def up
    change_table :cards do |t|
      t.change :name, :text
    end
  end

  def def down
    change_table :cards do |t|
      t.change :name, :string
    end
  end
end
