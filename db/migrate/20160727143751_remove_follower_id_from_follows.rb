class RemoveFollowerIdFromFollows < ActiveRecord::Migration[5.0]
  def change
    remove_column :follows, :follower_id, :integer
  end
end
