class CreateConfigurators < ActiveRecord::Migration
  def change
    create_table :configurators do |t|
      t.integer :max_enabled_step

      t.timestamps null: false
    end
  end
end
