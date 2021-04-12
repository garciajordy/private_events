class Event < ApplicationRecord
  belongs_to :creator, class_name: 'User', foreign_key: 'creator_id'
  has_many :invites
  has_many :attendees, through: :invites
  validates :discription, presence: true
  validates :date, presence: true
  scope :upcoming_events, ->(time = Time.now.midnight) { where('date > ?', time) }
  scope :past_events, ->(time = Time.now.midnight) { where('date < ?', time) }
end
