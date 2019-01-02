class CreatePaperDifficulties < ActiveRecord::Migration[5.2]
  def change
    create_table :paper_difficulties do |t|
      t.references  :paper, null: false, foreign_key: true
      t.integer     :rate
      t.references  :rater, null: false

      t.timestamps
    end
    add_foreign_key :paper_difficulties, :users, column: :rater_id, primary_key: :id
  end
end
