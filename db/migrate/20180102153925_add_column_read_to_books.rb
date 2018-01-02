class AddColumnReadToBooks < ActiveRecord::Migration[5.1]
  def change
    add_column :books, :read, :boolean
  end
end
