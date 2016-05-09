module DashboardHelper
  def proceed2_step
    if instance_saved
      if @current_step == from - 1
        form = RegistrationForm.find_by_student_id(@student)
        @current_step = form.current_step = form.current_step + 1
        form.current_step = form.current_step + 1 if @current_step == 7
        form.save
      end
    end

    render :proceed2_next
  end
end
