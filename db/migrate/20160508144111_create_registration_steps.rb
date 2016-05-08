class CreateRegistrationSteps < ActiveRecord::Migration
  def change
    create_table :registration_steps do |t|
      t.integer :position
      t.string :name
      t.string :icon
      t.string :url

      t.timestamps null: false
    end
  end
end
