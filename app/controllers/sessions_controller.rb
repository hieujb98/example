class SessionsController < ApplicationController
  include ApplicationHelper

  def new; end

  def create
    user = User.find_by email: params[:session][:email].downcase
    if user&.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == Settings.n1 ? remember(user) : forget(user)
        redirect_to user
      else
        flash[:warning] = t "sessions.activated_check_email"
        redirect_to root_url
      end
    else
      flash[:danger] = t "sessions.notification"
      render :new
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
