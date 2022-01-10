class Admin::AdminCommentsController < ApplicationController
  def create
    record = Record.find(params[:record_id])
    admin_comment = AdminComment.new(admin_comment_params)
    admin_comment.record_id = record.id
    admin_comment.save
    redirect_to admin_record_path(record)
  end

  def destroy
    record = Record.find(params[:record_id])
    admin_comment = AdminComment.find(params[:id])
    admin_comment.destroy
    redirect_to admin_record_path(record.id)
  end

  private

  def admin_comment_params
    params.require(:admin_comment).permit(:comment)
  end
end
