class CreateProgrammes < ActiveRecord::Migration
  def change
    create_table :programmes do |t|
      t.string :name
      t.string :programme_type
      t.boolean :entrance
      t.boolean :self_finance
      t.integer :intake
      t.string :indexing_rules
      t.string :ranking_priority
      t.integer :general
      t.integer :sc
      t.integer :st
      t.integer :muslim
      t.integer :handicapped
      t.integer :obc
      t.integer :obh
      t.integer :etb
      t.integer :latin
      t.boolean :disabled

      t.timestamps null: false
    end
  end
end
