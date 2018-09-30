#json.array! @events, :title

json.array! @events do |event|
  json.title event.title
  json.start event.start_at
  json.end event.end_at
end
