# frozen_string_literal: true

class CreateInvites < ActiveRecord::Migration[6.1]
  def change
    create_table :invites do |t|
      t.references :event, null: false, foreign_key: true
      t.string :user_name

      t.timestamps
    end
  end
end
