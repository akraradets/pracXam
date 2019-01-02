class CreatePaperFeedbacks < ActiveRecord::Migration[5.2]
  def change
    create_table :paper_feedbacks do |t|
      t.references  :paper,     null: false, foreign_key: true
      t.integer     :feedback
      t.references  :provider,  null: false

      t.timestamps
    end
    add_foreign_key :paper_feedbacks, :users, column: :provider_id, primary_key: :id
  end
end
