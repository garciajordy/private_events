class InvitesController < ApplicationController
  def new
    @event = Event.find(params[:event_id])
    @invite = @event.invites.build
  end

  def create
    @event = Event.find(params[:event_id])
    @invite = @event.invites.create(invite_params)
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
