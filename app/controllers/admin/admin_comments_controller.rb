class Admin::AdminCommentsController < ApplicationController
  before_action :authenticate_admin!

  def create
    @record = Record.find(params[:record_id])
    @admin_comment = AdminComment.new(admin_comment_params)
    @admin_comment.record_id = @record.id
    @admin_comment.save
    @admin_comment = AdminComment.new
  end

  def destroy
    @record = Record.find(params[:record_id])
    AdminComment.find_by(id: params[:id], record_id: params[:record_id]).destroy
    @admin_comment = AdminComment.new
  end

  private

  def admin_comment_params
    params.require(:admin_comment).permit(:comment)
  end

end
