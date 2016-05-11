class CreateStreams < ActiveRecord::Migration
  def change
    create_table :streams do |t|
      t.references :board, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
