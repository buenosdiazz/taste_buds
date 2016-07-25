class AddUserIdToTables < ActiveRecord::Migration[5.0]
  def change
    add_column :tables, :user_id, :integer
    add_index :tables, :user_id
  end
end
