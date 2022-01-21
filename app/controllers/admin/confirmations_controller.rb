class Admin::ConfirmationsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @record = Record.find(params[:record_id])
    @confirmation = @record.confirmations.new(record_id: @record.id)
    @record.update(work_status: 3)
    @confirmation.save
  end

  def destroy
    @record = Record.find(params[:record_id])
    @confirmation = @record.confirmations.find_by(record_id: @record.id)
    @record.update(work_status: 2)
    @confirmation.destroy
  end
end
