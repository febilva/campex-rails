class AddSubjectPositionToMarks < ActiveRecord::Migration
  def change
    add_column :marks, :subject_position, :integer
  end
end
