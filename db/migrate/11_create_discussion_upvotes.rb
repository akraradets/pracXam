class CreateDiscussionUpvotes < ActiveRecord::Migration[5.2]
  def change
    create_table :discussion_upvotes do |t|
      t.references :discussion, null: false, foreign_key: true
      t.references :voter,      null: false

      t.timestamps
    end
    add_foreign_key :discussion_upvotes, :users, column: :voter_id, primary_key: :id
  end
end
