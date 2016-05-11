class AddSameAddressToStudents < ActiveRecord::Migration
  def change
    add_column :students, :same_address, :boolean
  end
end
