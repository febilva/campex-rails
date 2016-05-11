class CreateStreamSubjects < ActiveRecord::Migration
  def change
    create_table :stream_subjects do |t|
      t.references :stream, foreign_key: true
      t.string :name
      t.integer :part
      t.integer :max_marks

      t.timestamps null: false
    end
  end
end
