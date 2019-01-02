class CreateDiscussionComments < ActiveRecord::Migration[5.2]
  def change
    create_table :discussion_comments do |t|
      t.references :user,       null: false, foreign_key: true
      t.references :discussion, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
