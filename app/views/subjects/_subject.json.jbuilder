json.extract! subject, :id, :code, :name, :cs_required, :im_required, :created_at, :updated_at
json.url subject_url(subject, format: :json)
