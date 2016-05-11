class AddBoardIdToStudent < ActiveRecord::Migration
  def change
    add_column :students, :board_id, :integer
    add_index :students, :board_id
  end
end
