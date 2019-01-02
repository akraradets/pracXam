class CreatePapers < ActiveRecord::Migration[5.2]
  def change
    create_table :papers do |t|
      t.string :year,           null: false
      t.string :month,          null: false
      t.string :annual,         null: false
      t.string :prof_name,      null: false
      t.string :duration,       null: false
      t.boolean :open_book,     null: false, default: false
      t.boolean :open_network,  null: false, default: false
      t.references :user,       null: false, foreign_key: true
      t.references :subject,    null: false, foreign_key: true

      t.timestamps
    end
  end
end
