class Admin::ClientsController < ApplicationController
  before_action :authenticate_admin!

  def index
    @clients = Client.all
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to admin_clients_path
    else
      @client = Client.all
      @client = Client.new
    end
  end

  def edit
    @client = Client.find(params[:id])
  end

  def update
    @client = Client.find(params[:id])
    if @client.update(client_params)
      redirect_to admin_clients_path
    else
      render :edit
    end
  end

  private

  def client_params
    params.require(:client).permit(:name, :zipcode, :address, :phone_number, :supervisor, :supervisor_phone_number)
  end
end