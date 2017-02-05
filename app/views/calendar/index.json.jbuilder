json.array! Schedule.all do |schedule|
  json.id schedule.id
  json.title schedule.title 
  json.date_from schedule.date_from
  json.date_to schedule.date_to
  json.place schedule.place
  json.content schedule.content
end