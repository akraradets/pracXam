ActiveAdmin.register_page "Dashboard" do

  menu priority: 1, label: proc{ I18n.t("active_admin.dashboard") }

  content title: proc{ I18n.t("active_admin.dashboard") } do
    div class: "blank_slate_container", id: "dashboard_default_message" do
      span class: "blank_slate" do
        span I18n.t("active_admin.dashboard_welcome.welcome")
        small I18n.t("active_admin.dashboard_welcome.call_to_action")
      end
    end

    # Here is an example of a simple dashboard with columns and panels.
    #
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
        # panel "Recent Registered Users" do
        #   ul do
        #     User.last(5).reverse.map do |post|

        #       li link_to(post.title, admin_user_path(post))
        #     end
        #   end
        # end
      end
    end

    #   column do
    #     panel "Info" do
    #       para "Welcome to ActiveAdmin."
    #     end
    #   end
    # end
  end # content
end
