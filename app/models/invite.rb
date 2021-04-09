class Invite < ApplicationRecord
  attr_accessor :attendence
  belongs_to :event
end
