class EventsController < ApplicationController
  before_action :logged_in_user

  def home; end

  def show
    @events = Event.all
    @check = Invite.accepted.where(user_name: current_user.name)
    @event = Event.find(params[:id])
    @invite = Invite.where(event_id: params[:id])
    @id = Invite.where(event_id: params[:id]).where(user_id: current_user.id).where(attendence: false)
    @test = Invite.where(event_id: params[:id]).where(user_id: current_user.id).where(attendence: true)
  end

  def new
    @event = Event.new
  end

  def index
    @events = Event.all
    @upcoming_events = Event.upcoming_events
    @past_events = Event.past_events
  end

  def create
    @user = current_user
    @event = @user.events.build(event_params)
    if @event.save
      flash[:success] = 'event has been created!'
      redirect_to root_path
    else
      render :new
    end
  end

  def edit
    @event = current_user.invites.where(event_id: params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = 'event updated'
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    if @event
      @event.destroy
      flash[:success] = 'event has been deleted'
    else
      flash[:alert] = 'Error'
    end
    redirect_to root_path
  end

  private

  def event_params
    params.require(:event).permit(:date, :discription)
  end
end
