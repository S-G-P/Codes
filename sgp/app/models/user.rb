class User < ActiveRecord::Base
    has_many :schedules_users
    has_many :schedules, :through => :schedules_users
end
