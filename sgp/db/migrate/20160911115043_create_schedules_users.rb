class CreateSchedulesUsers < ActiveRecord::Migration
  def change
    create_table :schedules_users do |t|
      t.references :schedule, index: true, foreign_key: true
      t.references :user, index: true, foreign_key: true

      t.timestamps null: false
    end
  end
end
