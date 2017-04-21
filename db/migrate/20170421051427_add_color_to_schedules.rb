class AddColorToSchedules < ActiveRecord::Migration
  def change
    add_column :schedules, :color, :text
  end
end
