class AddPosterToItems < ActiveRecord::Migration[5.0]
  def change
    add_column :items, :poster, :text
  end
end
