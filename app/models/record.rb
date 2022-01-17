class Record < ApplicationRecord
  belongs_to :worker
  belongs_to :client
  attachment :image
  has_many :admin_comments, dependent: :destroy
  has_many :public_comments, dependent: :destroy
  has_many :confirmations, dependent: :destroy

  validates :name, presence: true
  validates :body, presence: true

  #今週(曜日単体)
  scope :created_sunday, lambda { where(created_at: Time.zone.now.beginning_of_week.since(6.days).all_day) }
  scope :created_monday, lambda { where(created_at: Time.zone.now.beginning_of_week.all_day) }
  scope :created_tuesday, lambda { where(created_at: Time.zone.now.beginning_of_week.since(1.days).all_day) }
  scope :created_wednesday, lambda { where(created_at: Time.zone.now.beginning_of_week.since(2.days).all_day) }
  scope :created_thursday, lambda { where(created_at: Time.zone.now.beginning_of_week.since(3.days).all_day) }
  scope :created_friday, lambda { where(created_at: Time.zone.now.beginning_of_week.since(4.days).all_day) }
  scope :created_saturday, lambda { where(created_at: Time.zone.now.beginning_of_week.since(5.days).all_day) }
  #先週(曜日単体)
  scope :created_last_sunday, lambda { where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(6.days).all_day) }
  scope :created_last_monday, lambda { where(created_at: (Time.zone.now - 1.week).beginning_of_week.all_day) }
  scope :created_last_tuesday, lambda { where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(1.days).all_day) }
  scope :created_last_wednesday, lambda { where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(2.days).all_day) }
  scope :created_last_thursday, lambda { where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(3.days).all_day) }
  scope :created_last_friday, lambda { where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(4.days).all_day) }
  scope :created_last_saturday, lambda { where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(5.days).all_day) }
  #今週
  scope :created_this_week, lambda { where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week) }
  #先週
  scope :created_last_week, lambda { where(created_at: 1.week.ago.beginning_of_week..1.week.ago.end_of_week) }
  #今月
  scope :created_this_month, lambda { where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month) }
  #前年(月単位)
  scope :created_prev_year_month, lambda { where(created_at: Time.zone.now.prev_year.beginning_of_month..Time.zone.now.prev_year.end_of_month) }



  def confirmationed_by?(record)
    confirmations.where(record_id: record.id).exists?
  end

  enum work_status: {waiting_work: 0, start_work: 1, finish_work: 2, confirmed_work: 3}
end
