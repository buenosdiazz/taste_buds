class AddListIdToFollows < ActiveRecord::Migration[5.0]
  def change
    add_column :follows, :list_id, :integer
  end
end
