class ChangeNccWeightageTypeToString < ActiveRecord::Migration
  def change
    change_column(:students, :ncc, :string)
  end
end
