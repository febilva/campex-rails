class CreateMarks < ActiveRecord::Migration
  def change
    create_table :marks do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.belongs_to :stream_subject, index: true, foreign_key: true
      t.string :grade
      t.integer :score

      t.timestamps null: false
    end
  end
end
