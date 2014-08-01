class SessionsController < ApplicationController
  before_filter :require_no_user!, only: [:new, :create]

  def new
    render :new
  end

  def create
    @user = User.find_by_credentials(
    params[:user][:email], params[:user][:password])

    if @user.nil?
      #why is this set to an array?
      flash.now[:errors] = ["Incorrect username and/or password"]
      render :new
    else
      log_in_user!(@user)
      redirect_to user_url(@user)
    end
  end

  def destroy
    log_out_user!
    redirect_to new_session_url
  end

end
