class Public::RecordsController < ApplicationController
  def index
    @records = Record.all
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to public_record_path(@record)
    else
      render :new
    end
  end

  def show
    @record = Record.find(params[:id])
  end

  def update
    record = Record.find(params[:id])
    if record.update(record_params)
      redirect_to public_record_path(record)
    else
      render :edit
    end
  end

  private

  def record_params
    params.require(:record).permit(:name, :body, :woker_id, :client_id, :image, :start_time, :finish_time)
  end

end