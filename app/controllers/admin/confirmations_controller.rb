class Admin::ConfirmationsController < ApplicationController
  def create
    record = Record.find(params[:record_id])
    confirmation = Confirmation.new(record_id: record.id)
    confirmation.save
    record.update(work_status: 3)
    redirect_to admin_record_path(record)
  end

  def destroy
    record = Record.find(params[:record_id])
    confirmation = Confirmation.find_by(record_id: record.id)
    confirmation.destroy
    record.update(work_status: 2)
    redirect_to admin_record_path(record)
  end
end
