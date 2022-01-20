class ChangeCardName < ActiveRecord::Migration[6.1]
  def change
    rename_column :cards, :name, :title
  end
end
