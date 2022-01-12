class Public::RecordsController < ApplicationController

  def index
      @q = Record.ransack(params[:q])
      @workers = Worker.all
      @clients = Client.all
      @records = @q.result.includes(:worker, :client).order(created_at: :desc)
  end

  def new
    @record = Record.new
  end

  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to record_path(@record)
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
    redirect_to record_path(record)
  end

  def worker_search
    @q = Record.search(search_params)
    @records = @q.result(distinct: true).order(created_at: :desc)
  end

  def client_search
    @q = Record.search(search_params)
    @records = @q.result(distinct: true).order(created_at: :desc)
  end


  private

  def record_params
    params.require(:record).permit(:name, :body, :worker_id, :client_id, :image, :start_time, :finish_time, :work_status)
  end

  def search_params
    params.require(:q).permit(:worker_id_eq, :client_id_eq)
  end

end