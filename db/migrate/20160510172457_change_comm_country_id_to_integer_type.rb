class ChangeCommCountryIdToIntegerType < ActiveRecord::Migration
  def change
    change_column(:students, :comm_country_id, :integer)
  end
end
