class UsersController < ApplicationController
  before_filter :require_no_user!, only: [:new, :create]
  before_filter :require_user!, only: [:show]

  def new
    render :new
  end

  def create
    @user = User.new(user_params)

    if @user.save
      log_in_user!(@user)
      redirect_to bands_url
    else
      render :new
    end
  end

  def show
    #so this params[:id] basically takes it from the URL?
    @user = User.find(params[:id])
    render :show
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end

end
