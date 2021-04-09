class User < ApplicationRecord
  has_many :events
  validates :name, presence: true
  validates_uniqueness_of :name
end
