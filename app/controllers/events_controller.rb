class EventsController < ApplicationController
    before_action :logged_in_user
 def home
  end
  
  def new
    @event  = current_user.events.new
  end

  def index
    @events = Event.all
  end

  def create
    @event = current_user.events.build(event_params)
    if @event.save
      flash[:success] = "event has been created!"
      redirect_to @event
    else
      render 'new'
    end
  end

  def edit
    @event = current_user.events.find(params[:id])
  end

  def update
    @event = current_user.events.find(params[:id])
    if @event.update_attributes(event_params)
      flash[:success] = "event updated"
      redirect_to @event
    else
      render 'edit'
    end
  end

  def destroy
    @event = current_user.events.find(params[:id])
    if @event 
      @event.destroy
      flash[:success] = "event has been deleted"
    else
      flash[:alert] = "Error"
    end
    redirect_to root_path
  end

  def show
    @event = Event.find(params[:id])
  end

  private

  def event_params
    params.require(:event).permit(:name)
  end
end