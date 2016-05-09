class CreateDistricts < ActiveRecord::Migration
  def change
    create_table :districts do |t|
      t.references :state, foreign_key: true
      t.string :name
      t.string :code

      t.timestamps null: false
    end
  end
end
