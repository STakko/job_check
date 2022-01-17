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
  def self.created_sunday
    Record.where(created_at: Time.zone.now.beginning_of_week.since(6.days).all_day)
  end

  def self.created_monday
    Record.where(created_at: Time.zone.now.beginning_of_week.all_day)
  end

  def self.created_tuesday
    Record.where(created_at: Time.zone.now.beginning_of_week.since(1.days).all_day)
  end

  def self.created_wednesday
    Record.where(created_at: Time.zone.now.beginning_of_week.since(2.days).all_day)
  end

  def self.created_thursday
    Record.where(created_at: Time.zone.now.beginning_of_week.since(3.days).all_day)
  end

  def self.created_friday
    Record.where(created_at: Time.zone.now.beginning_of_week.since(4.days).all_day)
  end

  def self.created_saturday
    Record.where(created_at: Time.zone.now.beginning_of_week.since(5.days).all_day)
  end
  #先週(曜日単体)
  def self.created_last_sunday
    Record.where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(6.days).all_day)
  end

  def self.created_last_monday
    Record.where(created_at: (Time.zone.now - 1.week).beginning_of_week.all_day)
  end

  def self.created_last_tuesday
    Record.where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(1.days).all_day)
  end

  def self.created_last_wednesday
    Record.where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(2.days).all_day)
  end

  def self.created_last_thursday
    Record.where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(3.days).all_day)
  end

  def self.created_last_friday
    Record.where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(4.days).all_day)
  end

  def self.created_last_saturday
    Record.where(created_at: (Time.zone.now - 1.week).beginning_of_week.since(5.days).all_day)
  end
  #今週
  def self.created_this_week
    Record.where(created_at: Time.zone.now.beginning_of_week..Time.zone.now.end_of_week)
  end
  #先週
  def self.created_last_week
    Record.where(created_at: 1.week.ago.beginning_of_week..1.week.ago.end_of_week)
  end
  #今月
  def self.created_this_month
    Record.where(created_at: Time.zone.now.beginning_of_month..Time.zone.now.end_of_month)
  end
  #前年(月単位)
  def self.created_prev_year_month
    Record.where(created_at: Time.zone.now.prev_year.beginning_of_month..Time.zone.now.prev_year.end_of_month)
  end

  #確認ボタン
  def confirmationed_by?(record)
    confirmations.where(record_id: record.id).exists?
  end

  enum work_status: {waiting_work: 0, start_work: 1, finish_work: 2, confirmed_work: 3}
end
