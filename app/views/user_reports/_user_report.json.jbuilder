json.extract! user_report, :id, :user_id, :report, :reporter_id, :created_at, :updated_at
json.url user_report_url(user_report, format: :json)
