json.extract! to_do_item, :id, :user_id, :category_id, :title, :start_date, :start_time, :end_date, :end_time, :place, :memo, :attachment, :rank, :remind, :remind_time, :created_at, :updated_at
json.url to_do_item_url(to_do_item, format: :json)
