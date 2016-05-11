class AddSameAddressToGuardians < ActiveRecord::Migration
  def change
    add_column :guardians, :same_address, :boolean
  end
end
