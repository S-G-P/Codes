class User < ActiveRecord::Base
  has_many :schedule_users
  has_many :schedules, through: :schedule_users
  
  # throughオプションによりschedule_users経由でschedulesにアクセスできるようになる
  # 具体的には、user.schedulesでスケジュールにアクセスができる
  
  # class_nameオプションで関連するモデルのクラス名を指定でき、関連名と参照先のクラス名を異なるものにできる。
  # foreign_keyオプションで参照先を参照する外部キーの名前を指定できる。デフォルトは、参照先のモデル名_id
  # dependentオプションで親オブジェクトが削除された時の扱いを指定できる。destroyとdelete_allなどが指定可能。
  # asオプションでポリモフィック関連を定義できる。
  # throughオプションでモデル接続の関連を設定できる。
end
