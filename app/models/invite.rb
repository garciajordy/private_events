class Invite < ApplicationRecord  
  belongs_to :event
  attr_writer :attendence
end
