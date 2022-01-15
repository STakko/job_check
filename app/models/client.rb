class Client < ApplicationRecord
  has_many :records

  validates :name, presence: true
  validates :supervisor, presence: true
end
