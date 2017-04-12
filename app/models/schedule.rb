class Schedule < ActiveRecord::Base
  has_many :schedule_users, dependent: :delete_all
  has_many :users, through: :schedule_users
  accepts_nested_attributes_for :schedule_users, allow_destroy: true
  
  # scheduleがusersに所属している。かつscheduleのuser_idは必須
  belongs_to :user
  validates :user_id, presence: true

  # throughオプションによりschedule_users経由でusersにアクセスできるようになる
  # 具体的には、schedule.usersでうユーザーにアクセスができる
end
