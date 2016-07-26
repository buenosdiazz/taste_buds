class RenameTablesTableToLists < ActiveRecord::Migration[5.0]
  def change
    rename_table :tables, :lists
  end
end
