class Event < ApplicationRecord
  belongs_to :worker
  validates :title, presence: true
  validates :content, presence: true
  validates :start_time, presence: true
end
