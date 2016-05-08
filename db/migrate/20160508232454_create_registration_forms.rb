class CreateRegistrationForms < ActiveRecord::Migration
  def change
    create_table :registration_forms do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.integer :current_step
      t.boolean :instructions_read

      t.timestamps null: false
    end
  end
end
