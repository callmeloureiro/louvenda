class Painel::DashboardController < Painel::BaseController

  def index
    @client = Client.new
    @product = Product.new
    @clients = Client.order('id DESC').limit(10)
    @sale = Sale.new
    @sales = Sale.order('id DESC').take(10)
    @salesweek = Sale.sale_last_week
    @salestoday = Sale.sale_today
  end

end
