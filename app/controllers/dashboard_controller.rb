class DashboardController < ApplicationController
  def index
  end

  def instructions
    if request.post?
      @origin_step = RegistrationStep.find_by_name('Instructions')
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

  def address
  end

  def guardian
  end

  def weightages
  end

  def education
  end

  def marks
    subject_structure= current_user.board.subject_structure
    @subject_structure = subject_structure.split(',').map{ |part| part.to_i }
    @total_parts = @subject_structure.count
    @subjects = []
    1.upto(@total_parts) do |part_number|
      @subjects << StreamSubject.where(stream_id: current_user.stream_id, part: part_number)
    end
    @total_subjects = @subject_structure.sum

    @stream_subjects = []
    @marks = []
    @max_marks = []
    Mark.where(student_id: current_user.id).each do |mark|
      @stream_subjects[mark.subject_position] = mark.stream_subject_id
      @marks[mark.subject_position] = mark.score
      @max_marks[mark.subject_position] = mark.stream_subject.max_marks
    end
  end

  def phase_completed
  end

  def update_menu
  end
end
