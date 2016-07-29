class AddCategoryIdToLists < ActiveRecord::Migration[5.0]
  def change
    add_column :lists, :category_id, :integer
  end
end
