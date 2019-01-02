ActiveAdmin.register User do
  config.per_page = [10, 50, 100]
  actions :all, except: [:destroy]

  permit_params :username, :title, :name, :user_type, :email, :score, :banned, 
  :remember_created_at, :sign_in_count, :current_sign_in_at, 
  :last_sign_in_at, :current_sign_in_ip, :last_sign_in_ip

  index do
    # selectable_column
    # id_column
    column :username
    column :name
    column :title
    column :user_type
    column :email
    column :score
    column :created_at
    column :banned
    actions
  end

  form do |f|
    f.semantic_errors # shows errors on :base
    f.inputs f.object.username  do
      f.input :score
      f.input :banned
    end
    f.actions         # adds the 'Submit' and 'Cancel' buttons
  end
  
end