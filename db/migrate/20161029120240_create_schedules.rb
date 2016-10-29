class CreateSchedules < ActiveRecord::Migration
  def change
    create_table :schedules do |t|
      t.string :title
      t.datetime :date_from
      t.datetime :date_to
      t.string :place
      t.text :content

      t.timestamps null: false
    end
  end
end
