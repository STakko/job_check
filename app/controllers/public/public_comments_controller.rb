class Public::PublicCommentsController < ApplicationController
  before_action :authenticate_shared_user!

  def create
    @record = Record.find(params[:record_id])
    @public_comment = PublicComment.new(public_comment_params)
    @public_comment.record_id = @record.id
    @public_comment.save
    @public_comment = PublicComment.new
  end

  def destroy
    @record = Record.find(params[:record_id])
    PublicComment.find_by(id: params[:id], record_id: params[:record_id]).destroy
    @public_comment = PublicComment.new
  end

  private

  def public_comment_params
    params.require(:public_comment).permit(:comment)
  end
end
