class Public::PublicCommentsController < ApplicationController
  def create
    record = Record.find(params[:record_id])
    public_comment = PublicComment.new(public_comment_params)
    public_comment.record_id = record.id
    public_comment.save
    redirect_to record_path(record)
  end

  def destroy
    PublicComment.find_by(id: params[:id], record_id: params[:record_id]).destroy
    redirect_to record_path(params[:record_id])
  end

  private

  def public_comment_params
    params.require(:public_comment).permit(:comment)
  end
end
