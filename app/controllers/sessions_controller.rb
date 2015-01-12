class SessionsController < ApplicationController
  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.find_by_credentials(
      params[:user][:username],
      params[:user][:password]
    )

    if @user
      log_in!(@user)
      redirect_to user_url(@user)
    else
      flash.now[:errors] = ["Invalid credentials"]
      @user = User.new(username: params[:user][:username])
      fail
      render :new
    end
  end

  def destroy
    current_user.reset_session_token! if current_user
    session[:token] = nil
    redirect_to new_session_url
  end
end