class Public::EventsController < ApplicationController
  def index
    @events = Event.page(params[:page]).reverse_order.per(9)
  end

  def show
    @event = Event.find(params[:id])
  end

end
