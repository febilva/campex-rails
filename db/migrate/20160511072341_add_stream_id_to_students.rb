class AddStreamIdToStudents < ActiveRecord::Migration
  def change
    add_column :students, :stream_id, :integer
    add_index :students, :stream_id
  end
end
