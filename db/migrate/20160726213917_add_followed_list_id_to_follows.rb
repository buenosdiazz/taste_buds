class AddFollowedListIdToFollows < ActiveRecord::Migration[5.0]
  def change
    add_column :follows, :followed_list_id, :integer
  end
end
