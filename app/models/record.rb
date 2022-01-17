class Record < ApplicationRecord
  belongs_to :worker
  belongs_to :client
  attachment :image
  has_many :admin_comments, dependent: :destroy
  has_many :public_comments, dependent: :destroy
  has_many :confirmations, dependent: :destroy

  validates :name, presence: true
  validates :body, presence: true
  #今日
  scope :created_today, -> { where(created_at: Time.zone.now.all_day) }
  #昨日
  scope :created_yesterday, -> { where(created_at: 1.day.ago.all_day) }
  #今週(曜日単体)
  scope :created_monday, -> { where(created_at: Date.today.beginning_of_week(:monday)) }
  scope :created_tuesday, -> { where(created_at: Date.today.beginning_of_week(:tuesday)) }
  scope :created_wednesday, -> { where(created_at: Date.today.beginning_of_week(:wednesday)) }
  scope :created_thursday, -> { where(created_at: Date.today.beginning_of_week(:thursday)) }
  scope :created_friday, -> { where(created_at: Date.today.beginning_of_week(:friday)) }
  #先週(曜日単体)
  scope :created_last_monday, -> { where(created_at: (Date.today - 1.week).beginning_of_week(:monday)) }
  scope :created_last_tuesday, -> { where(created_at: (Date.today - 1.week).beginning_of_week(:tuesday)) }
  scope :created_last_wednesday, -> { where(created_at: (Date.today - 1.week).beginning_of_week(:wednesday)) }
  scope :created_last_thursday, -> { where(created_at: (Date.today - 1.week).beginning_of_week(:thursday)) }
  scope :created_last_friday, -> { where(created_at: (Date.today - 1.week).beginning_of_week(:friday)) }
  #今週
  scope :created_this_week, -> { where(created_at: Date.today.beginning_of_week(:monday)..Date.today.beginning_of_week(:friday)) }
  #先週
  scope :created_last_week, -> { where(created_at: (Date.today - 1.week).beginning_of_week(:monday)..(Date.today - 1.week).beginning_of_week(:friday)) }
  #今月
  scope :created_this_month, -> { where(created_at: Date.today.beginning_of_month..Date.today.end_of_month) }
  #前年(月単位)
  scope :created_prev_year_month, -> { where(created_at: Date.today.prev_year.beginning_of_month..Date.today.prev_year.end_of_month) }
  
  

  def confirmationed_by?(record)
    confirmations.where(record_id: record.id).exists?
  end

  enum work_status: {waiting_work: 0, start_work: 1, finish_work: 2, confirmed_work: 3}
end
