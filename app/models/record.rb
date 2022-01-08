class Record < ApplicationRecord
  belongs_to :woker
  belongs_to :client
  attachment :image
  
  enum work_status: {waiting_work: 0, start_work: 1, finish_work: 2, confirmed_work: 3}
end
