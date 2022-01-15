class Worker < ApplicationRecord
  validates :name, presence: true
  has_many :records
  has_many :events
end
