class Public::EventsController < ApplicationController
  before_action :authenticate_shared_user!
  
  def index
    @events = Event.page(params[:page]).reverse_order.per(9)
  end

  def show
    @event = Event.find(params[:id])
  end

end
