class SessionsController < ApplicationController
  layout false

  def new
  end

  def create
    @student = Student.find_by_email(request.env['omniauth.auth']['info']['email'])

    unless @student
      user_info = {}

      if params[:provider] == 'facebook' || params[:provider] == 'google_oauth2'
        user_info = {
          email: request.env['omniauth.auth']['info']['email'],
          name: request.env['omniauth.auth']['info']['name'],
          gender: request.env['omniauth.auth']['info']['gender']
        }
      end

      @student = Student.new(user_info.compact)
      @student.build_guardian
      @registration_form = @student.build_registration_form
      @registration_form.current_step = 0
      @registration_form.instructions_read = false

    end

    if(@student.save)
      session[:user_id] = @student.id
      session[:user_type] = "student"

      redirect_to dashboard_index_url
    else
      redirect_to root_url
    end
  end

  def destroy
    reset_session
    redirect_to root_url
  end

  def ccavRequestHandler
  end
end
