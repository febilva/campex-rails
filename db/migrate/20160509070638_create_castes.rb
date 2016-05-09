class CreateCastes < ActiveRecord::Migration
  def change
    create_table :castes do |t|
      t.references :reservation_category, foreign_key: true
      t.string :name

      t.timestamps null: false
    end
  end
end
