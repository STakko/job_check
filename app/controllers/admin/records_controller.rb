class Admin::RecordsController < ApplicationController

  def index
    @q = Record.ransack(params[:q])
    @workers = Worker.all
    @clients = Client.all
    @records = @q.result.includes(:worker, :client).order(created_at: :desc)
  end

  def show
    @record = Record.find(params[:id])
    @admin_comment = AdminComment.new
    @admin_comments = AdminComment.page(params[:page]).reverse_order.per(5)
    @public_comments = PublicComment.page(params[:page]).reverse_order.per(5)
  end

  def edit
    @record = Record.find(params[:id])
  end

  def update
    @record = Record.find(params[:id])
    if @record.update(record_params)
      redirect_to admin_record_path(@record)
    else
      render :edit
    end
  end

  def worker_search
    @q = Record.search(search_params)
    @records = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).reverse_order.per(9)
  end

  def client_search
    @q = Record.search(search_params)
    @records = @q.result(distinct: true).order(created_at: :desc).page(params[:page]).reverse_order.per(9)
  end

  private

  def record_params
    params.require(:record).permit(:name, :body, :woker_id, :client_id, :image, :start_time, :finish_time, :work_status)
  end

  def search_params
    params.require(:q).permit(:worker_id_eq, :client_id_eq)
  end

end
