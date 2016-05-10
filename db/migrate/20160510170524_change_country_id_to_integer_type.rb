class ChangeCountryIdToIntegerType < ActiveRecord::Migration
  def change
    change_column(:students, :country_id, :integer)
  end
end
