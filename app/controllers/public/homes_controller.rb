class Public::HomesController < ApplicationController

  def top
    unless shared_user_signed_in?
      redirect_to new_shared_user_session_path
    else
      redirect_to records_path
    end
  end
end
