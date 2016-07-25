class AddTitleToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :title, :string
  end
end
