class AddUserIdToFollows < ActiveRecord::Migration[5.0]
  def change
    add_column :follows, :user_id, :integer
  end
end
