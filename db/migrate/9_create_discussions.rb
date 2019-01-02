class CreateDiscussions < ActiveRecord::Migration[5.2]
  def change
    create_table :discussions do |t|
      t.references :user,  null: false, foreign_key: true
      t.references :paper, null: false, foreign_key: true
      t.string :content

      t.timestamps
    end
  end
end
