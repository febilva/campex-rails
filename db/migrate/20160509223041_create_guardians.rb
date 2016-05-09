class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.belongs_to :student, index: true, foreign_key: true
      t.string :name
      t.string :gender
      t.string :email
      t.string :mobile_no
      t.string :phone_no
      t.string :relationship
      t.belongs_to :qualification, index: true, foreign_key: true
      t.belongs_to :occupation, index: true, foreign_key: true
      t.string :annual_income
      t.string :address_line1
      t.string :address_line2
      t.belongs_to :country, index: true, foreign_key: true
      t.belongs_to :state, index: true, foreign_key: true
      t.belongs_to :district, index: true, foreign_key: true
      t.string :taluk
      t.string :post_office
      t.string :pincode

      t.timestamps null: false
    end
  end
end
