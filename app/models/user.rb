class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # throughオプションによりschedule_users経由でschedulesにアクセスできるようになる
  # 具体的には、user.schedulesでスケジュールにアクセスができる
  # has_many :schedule_users
  # has_many :schedules, through: :schedule_users
  
  # userとscheduleは1対多の関係
  has_many :schedules

  # class_nameオプションで関連するモデルのクラス名を指定でき、関連名と参照先のクラス名を異なるものにできる。
  # foreign_keyオプションで参照先を参照する外部キーの名前を指定できる。デフォルトは、参照先のモデル名_id
  # dependentオプションで親オブジェクトが削除された時の扱いを指定できる。destroyとdelete_allなどが指定可能。
  # asオプションでポリモフィック関連を定義できる。
  # throughオプションでモデル接続の関連を設定できる。
end
