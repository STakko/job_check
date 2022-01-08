class Record < ApplicationRecord
  belongs_to :woker
  belongs_to :client
  attachment :image
end
