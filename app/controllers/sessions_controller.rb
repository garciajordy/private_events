class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(name: params[:session][:name].downcase)
    if user
      log_in user
      @user = User.find(user.id)
      redirect_to root_path
    else
      flash.now[:danger] = 'Invalid name'
      render 'new'
    end
  end

  def destroy
    log_out
    redirect_to root_url
  end
end
