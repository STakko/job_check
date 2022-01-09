class Admin::RecordCommentsController < ApplicationController
  def create
    @record = Record.find(params[:record_id])
    @record_comment = RecordComment.new(record_comment_params)
    @record_comment.admin_id = current_admin.id
    @record_comment.shared_user_id = nil
    @record_comment.record_id = @record.id
    @record_comment.save
    redirect_to admin_record_path(@record)
  end

  def destroy
    RecordComment.find_by(id: params[:id], record_id: params[:record_id]).destroy
    record = Record.find(params[:record_id])
    redirect_to admin_record_path(record)
  end

  private

  def record_comment_params
    params.require(:record_comment).permit(:comment)
  end
end
