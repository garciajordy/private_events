class Invite < ApplicationRecord
  belongs_to :event
  belongs_to :attendee, class_name: 'User', foreign_key: 'user_id'
  scope :accepted, -> { where('attendence == ?', true) }
end
