class AddContentToCards < ActiveRecord::Migration[6.1]
  def change
    add_column :cards, :content, :text
  end
end
