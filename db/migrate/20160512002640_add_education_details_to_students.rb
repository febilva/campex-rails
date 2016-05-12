class AddEducationDetailsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :tenth_yos, :integer
    add_column :students, :tenth_yop, :integer
    add_column :students, :tenth_regno, :string
    add_column :students, :tenth_institution, :string
    add_column :students, :twelfth_yos, :integer
    add_column :students, :twelfth_yop, :integer
    add_column :students, :twelfth_regno, :string
    add_column :students, :twelfth_institution, :string
    add_column :students, :twelfth_tc_no, :string
    add_column :students, :twelfth_tc_date, :string
  end
end
