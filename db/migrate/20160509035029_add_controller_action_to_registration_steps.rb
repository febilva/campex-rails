class AddControllerActionToRegistrationSteps < ActiveRecord::Migration
  def change
    add_column :registration_steps, :controller, :string
    add_column :registration_steps, :action, :string
  end
end
