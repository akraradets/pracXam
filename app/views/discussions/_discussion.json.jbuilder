json.extract! discussion, :id, :user_id, :paper_id, :content, :created_at, :updated_at
json.url discussion_url(discussion, format: :json)
