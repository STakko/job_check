class Public::HomesController < ApplicationController
  def top
    redirect_to records_path
  end
end
