class CreateBoards < ActiveRecord::Migration
  def change
    create_table :boards do |t|
      t.string :name
      t.string :subject_structure
      t.boolean :disabled

      t.timestamps null: false
    end
  end
end
