class AddAddressDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :address_line1, :string
    add_column :students, :address_line2, :string
    add_column :students, :post_office, :string
    add_column :students, :taluk, :string
    add_reference :students, :district, index: true, foreign_key: true
    add_reference :students, :state, index: true, foreign_key: true
    add_reference :students, :country, index: true, foreign_key: true
    add_column :students, :pincode, :string
    add_column :students, :comm_address_line1, :string
    add_column :students, :comm_address_line2, :string
    add_column :students, :comm_post_office, :string
    add_column :students, :comm_taluk, :string
    add_column :students, :comm_district_id, :integer
    add_index :students, :comm_district_id
    add_column :students, :comm_state_id, :integer
    add_index :students, :comm_state_id
    add_column :students, :comm_country_id, :string
    add_column :students, :comm_pincode, :string
  end
end
