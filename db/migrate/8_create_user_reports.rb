class CreateUserReports < ActiveRecord::Migration[5.2]
  def change
    create_table :user_reports do |t|
      t.references  :user,      null: false, foreign_key: true
      t.string      :report
      t.references  :reporter,  null: false

      t.timestamps 
    end
    add_foreign_key :user_reports, :users, column: :reporter_id, primary_key: :id
  end
end
