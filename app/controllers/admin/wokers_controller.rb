class Admin::WokersController < ApplicationController
  before_action :authenticate_admin!

  def index
    @wokers = Woker.all
    @woker = Woker.new
  end

  def create
    @woker = Woker.new(woker_params)
    if @woker.save
      redirect_to admin_wokers_path
    else
      @wokers = Woker.all
      @woker = Woker.new
    end
  end

  def edit
    @woker = Woker.find(params[:id])
  end

  def update
    @woker = Woker.find(params[:id])
    if @woker.update(woker_params)
      redirect_to admin_wokers_path
    else
      render :edit
    end
  end

  private

  def woker_params
    params.require(:woker).permit(:name)
  end
end
