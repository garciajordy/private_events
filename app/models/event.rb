class Event < ApplicationRecord
  belongs_to :user
  has_many :invites
  validates :discription, presence: true
  validates :date, presence: true
end
