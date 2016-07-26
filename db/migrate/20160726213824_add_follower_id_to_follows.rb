class AddFollowerIdToFollows < ActiveRecord::Migration[5.0]
  def change
    add_column :follows, :follower_id, :integer
  end
end
