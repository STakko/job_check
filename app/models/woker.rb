class Woker < ApplicationRecord
  validates :name, presence: true
  has_many :records
end
