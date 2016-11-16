class CreateSchedulesUsers < ActiveRecord::Migration
  def change
    create_table :schedules_users do |t|
      t.integer :schedule_id
      t.interger :user_id

      t.timestamps null: false
    end
  end
end
