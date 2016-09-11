class Schedule < ActiveRecord::Base
    has_many :schedules_users
    has_many :users, :through => :schedules_users
end
