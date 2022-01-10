class Record < ApplicationRecord
  belongs_to :worker
  belongs_to :client
  attachment :image
  has_many :admin_comments, dependent: :destroy
  has_many :public_comments, dependent: :destroy
  has_many :confirmations, dependent: :destroy
  
  def confirmationed_by?(record)
    confirmations.where(record_id: record.id).exists?
  end

  enum work_status: {waiting_work: 0, start_work: 1, finish_work: 2, confirmed_work: 3}
end
