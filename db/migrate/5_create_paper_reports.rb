class CreatePaperReports < ActiveRecord::Migration[5.2]
  def change
    create_table :paper_reports do |t|
      t.references :paper,    null: false, foreign_key: true
      t.string     :report
      t.references :reporter, null: false

      t.timestamps
    end
    add_foreign_key :paper_reports, :users, column: :reporter_id, primary_key: :id
  end
end
