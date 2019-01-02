ActiveAdmin.register_page "Users Statistic" do
  breadcrumb do
    ['admin', 'Users','statistic']
  end
  menu label: 'Statistic', parent: "Users"
  content do
    render partial: 'charts'
    columns do
      panel "Your New Users" do
        table_for User.last(5).reverse do
          column "Username",    :username
          column "Title",       :title
          column "Full Name",   :name
          column "Type",        :user_type
          column "Email",       :email
          column "Score",       :score
          column "Created At",  :created_at
        end
      end
    end
  end
end