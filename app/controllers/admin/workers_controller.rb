class Admin::WorkersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @workers = Worker.page(params[:page]).reverse_order.per(6)
    @worker = Worker.new
  end

  def create
    @worker = Worker.new(worker_params)
    if @worker.save
      redirect_to admin_workers_path
    else
      @workers = Worker.all
      @worker = Worker.new
    end
  end

  def edit
    @worker = Worker.find(params[:id])
  end

  def update
    @worker = Worker.find(params[:id])
    if @worker.update(worker_params)
      redirect_to admin_workers_path
    else
      render :edit
    end
  end

  private

  def worker_params
    params.require(:worker).permit(:name)
  end
end
