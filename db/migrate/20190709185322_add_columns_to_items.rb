class AddColumnsToItems < ActiveRecord::Migration[5.2]
  def change
    add_column :items, :character_id, :integer
    add_column :items, :room_id, :integer
  end
end
