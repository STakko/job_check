class Public::RecordsController < ApplicationController

  def index
    @search = Woker.ransack(params[:q])
    @search = Client.ransack(params[:q])
    @search_records = @search.result.order(created_at: :desc)
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
    @public_comment = PublicComment.new
  end

  def update
    record = Record.find(params[:id])
    record.update(record_params)
    if record.work_status == 'waiting_work'
      record.update(work_status: 1)
    elsif record.work_status == 'start_work'
      record.update(work_status: 2)
    end
    redirect_to public_record_path(record)
  end

  private

  def record_params
    params.require(:record).permit(:name, :body, :woker_id, :client_id, :image, :start_time, :finish_time, :work_status)
  end

end