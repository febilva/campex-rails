class AddWeightageDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :blind, :boolean
    add_column :students, :deaf, :boolean
    add_column :students, :orthopedic, :boolean
    add_column :students, :ex_service, :boolean
    add_column :students, :nss, :boolean
    add_column :students, :ncc, :boolean
    add_column :students, :arts, :boolean
    add_column :students, :sports, :boolean
    add_column :students, :no_of_chances, :integer
    add_column :students, :illiteracy_eradication, :boolean
  end
end
