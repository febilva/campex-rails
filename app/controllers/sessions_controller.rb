class SessionsController < ApplicationController
  layout false

  def new
  end

  def create
    @student = Student.find_by_email(request.env['omniauth.auth']['info']['email'])

    unless @student
      user_info = {}

      if params[:provider] == 'facebook'
        user_info = {
          email: request.env['omniauth.auth']['info']['email'],
          name: request.env['omniauth.auth']['info']['name'],
          gender: request.env['omniauth.auth']['info']['gender']
        }
      end

      @student = Student.create(user_info.compact)
    end

    if(@student)
      session[:user_id] = @student.id
      session[:user_type] = "student"

      redirect_to dashboard_index_url
    else
      redirect_to root_url
    end
  end

  def destroy
  end
end
