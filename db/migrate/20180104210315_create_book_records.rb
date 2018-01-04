class CreateBookRecords < ActiveRecord::Migration[5.1]
  def change
    create_table :book_records do |t|
      t.integer :user_id
      t.integer :book_id
      t.date :date
      t.string :comments

      t.timestamps
    end
  end
end
