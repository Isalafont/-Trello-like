# frozen_string_literal: true

class CreateAttachments < ActiveRecord::Migration[6.1]
  def change
    create_table :attachments do |t|
      t.timestamps
    end
  end
end
