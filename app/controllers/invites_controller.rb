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

  def edit
    @invite = Event.find(params[:id]).invites.where(user_name: current_user.name)
  end
  #  @new = Invite.where(event_id: event.id).where(user_name: current_user.name) 
  def update
    @invite = Event.find(params[:id]).invites.where(user_name: current_user.name)
    @invite.attendence = true
    @invite.update(update_params)
      flash[:success] = 'invitation updated'

  end


  private

  def invite_params
    params.require(:invite).permit(:user_name)
  end

  def update_params
    params.require(:invite).permit(:user_name, :attendence)
  end
end
