class Admin::EventsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @events = Event.page(params[:page]).reverse_order.per(9)
  end

  def new
    @event = Event.new
  end

  def create
    @event = Event.new(event_params)
    if @event.save!
      redirect_to admin_events_path
    else
      render :new
    end
  end

  def show
    @event = Event.find(params[:id])
  end

  def edit
    @event = Event.find(params[:id])
  end

  def update
    @event = Event.find(params[:id])
    if @event.update(event_params)
      redirect_to admin_event_path(@event)
    else
      render :edit
    end
  end

  private

  def event_params
    params.require(:event).permit(:worker_id, :title, :content, :start_time)
  end

end
