class AdminComment < ApplicationRecord
  belongs_to :record
  validates :comment, presence: true
end
