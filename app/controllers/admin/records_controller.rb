class Admin::RecordsController < ApplicationController
  
  def index
    @records = Record.all
  end

  def show
    @record = Record.find(params[:id])
    @admin_comment = AdminComment.new
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

  private

  def record_params
    params.require(:record).permit(:name, :body, :woker_id, :client_id, :image, :start_time, :finish_time, :work_status)
  end
end
