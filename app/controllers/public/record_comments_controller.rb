class Public::RecordCommentsController < ApplicationController
  def create
    record = Record.find(params[:record_id])
    comment = RecordComment.new(record_comment_params)
    comment.shared_user_id = current_shared_user.id
    comment.record_id = record.id
    comment.save
    redirect_to admin_record_path(record)
  end

  private

  def record_comment_params
    params.require(:record_comment).permit(:comment)
  end

end
