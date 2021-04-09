class InvitesController < ApplicationController
    def new
      @invite = Invite.new
    end

    def create
      @invite = Invite.new(invite_params)
      if @invite.save
        redirect_to root_path
      else
        render :new
      end
    end
 
    private
    def invite_params
        params.require(:invite).permit(:user_name)
    end


end
