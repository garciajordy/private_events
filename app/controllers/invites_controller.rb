class InvitesController < ApplicationController
  def show
    @invite = Invite.where(event_id: params[:id]).where(user_id: current_user.id).first
  end

  def new
    @event = Event.find(params[:event_id])
    @invite = @event.invites.build
  end

  def create
    @event = Event.find(params[:event_id])

    @invite = @event.invites.create(invite_params)
    if @invite.save
      redirect_to @event
    else
      render :new
    end
  end

  # def activate
  #   @event = Event.find(params[:event_id])
  #   @invite = Invite.find(@event.id)
  #   @invite.update(discription: true)
  #   redirect_to root_path
  # end

  # def deactivate
  #   @event = Event.find(params[:event_id])
  #   @invite = Invite.find(@event.id)
  #   @invite.update(discription: false)
  # end
  private

  def invite_params
    params.require(:invite).permit(:user_id)
  end

  def update_params
    params.require(:invite).permit(:user_name, :attendence)
  end
end
