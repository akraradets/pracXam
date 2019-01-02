json.extract! discussion_comment, :id, :user_id, :discussion_id, :content, :created_at, :updated_at
json.url discussion_comment_url(discussion_comment, format: :json)
