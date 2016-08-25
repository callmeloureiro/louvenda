class Painel::ClientsController < Painel::BaseController

  before_action :set_client, :only => [ :show, :edit, :update, :destroy ]

  def index
    @clients = Client.all
  end

  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    respond_to do |f|
      if @client.save
        f.json { render json: @client }
        f.html { redirect_to painel_clients_path }
      end
    end
  end

  def show

  end

  def edit

  end

  def update
    respond_to do |f|
      if @client.update_attributes(client_params)
        f.html { redirect_to painel_clients_path }
      end
    end
  end

  def destroy
    @client.destroy
    respond_to do |f|
      f.html { redirect_to painel_clients_path }
    end
  end

  private

    def client_params
      params.require(:client).permit(:name, :telephone, :cellphone, :email, :password, :password_confirmation, :CEP, :address_line, :number, :district, :city, :state, :status)
    end

    def set_client
      @client = Client.find(params[:id])
    end

end