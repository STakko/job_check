class Admin::HomesController < ApplicationController
  def top
    redirect_to admin_records_path
  end
end
