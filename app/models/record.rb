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
  
  #グラフに出力するために使用
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) } 
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) } 
  scope :created_2days_ago, -> { where(created_at: 2.days.ago.all_day) } 
  scope :created_3days_ago, -> { where(created_at: 3.days.ago.all_day) } 
  scope :created_4days_ago, -> { where(created_at: 4.days.ago.all_day) } 
  scope :created_5days_ago, -> { where(created_at: 5.days.ago.all_day) } 
  scope :created_6days_ago, -> { where(created_at: 6.days.ago.all_day) } 
end
