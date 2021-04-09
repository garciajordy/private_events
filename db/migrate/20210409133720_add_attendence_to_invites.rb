# frozen_string_literal: true

class AddAttendenceToInvites < ActiveRecord::Migration[6.1]
  def change
    add_column :invites, :attendence, :boolean, default: false
  end
end
