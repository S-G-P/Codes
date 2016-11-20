class Schedule < ActiveRecord::Base
  has_many :schedule_users
  has_many :users, through: :schedule_users

  # throughオプションによりschedule_users経由でusersにアクセスできるようになる
  # 具体的には、schedule.usersでうユーザーにアクセスができる
end
