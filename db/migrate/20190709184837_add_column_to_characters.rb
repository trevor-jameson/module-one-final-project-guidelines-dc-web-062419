class AddColumnToCharacters < ActiveRecord::Migration[5.2]
  def change
    add_column :characters, :room_id, :integer
  end
end
