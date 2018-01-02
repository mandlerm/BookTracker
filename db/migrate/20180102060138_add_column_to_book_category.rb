class AddColumnToBookCategory < ActiveRecord::Migration[5.1]
  def change
    add_column :book_categories, :notes, :string
  end
end
