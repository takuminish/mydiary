class CreateDiaries < ActiveRecord::Migration[5.1]
  def change
    create_table :diaries do |t|
      t.text :statement
      t.string :display_date
      t.references :user, foreign_key: true
      t.timestamps
    end
  end
end
