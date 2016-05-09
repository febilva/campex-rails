class AddPersonalDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :aadhar_no, :string
    add_column :students, :mobile_no, :string
    add_column :students, :phone_no, :string
    add_column :students, :blood_group, :string
    add_column :students, :dob, :string
    add_column :students, :religion, :string
    add_reference :students, :reservation_category, index: true, foreign_key: true
    add_reference :students, :caste, index: true, foreign_key: true
    add_column :students, :nationality_id, :integer
    add_index :students, :nationality_id
    add_column :students, :birth_place, :string
    add_column :students, :born_in, :string
  end
end
