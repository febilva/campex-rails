class DashboardController < ApplicationController
  def index
  end

  def instructions
    if request.post?
      @registration_form = current_user.registration_form
      unless @registration_form.instructions_read
        @registration_form.increment(:current_step)
        @registration_form.update(instructions_read: true)
      end
      render :proceed2_next
    end
  end

  def personal
  end

  def update_menu
  end
end
