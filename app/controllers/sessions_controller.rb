class SessionsController < ApplicationController
    def new
    end
  
    def create
      user = User.find_by(name: params[:session][:name].downcase)
      if user
        @user = User.find(user.id)
        log_in user
        redirect_to user_events_path(@user)
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
