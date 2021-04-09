class Event < ApplicationRecord
  belongs_to :user
  validates :discription, presence: true
  validates :date, presence: true
end
