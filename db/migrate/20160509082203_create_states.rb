class CreateStates < ActiveRecord::Migration
  def change
    create_table :states do |t|
      t.references :country, foreign_key: true
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
