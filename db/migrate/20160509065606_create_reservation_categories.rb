class CreateReservationCategories < ActiveRecord::Migration
  def change
    create_table :reservation_categories do |t|
      t.string :name

      t.timestamps null: false
    end
  end
end
