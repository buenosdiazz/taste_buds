class RemoveFollowedListIdFromFollows < ActiveRecord::Migration[5.0]
  def change
    remove_column :follows, :followed_list_id, :integer
  end
end
