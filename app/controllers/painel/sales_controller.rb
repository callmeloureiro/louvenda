class Painel::SalesController < Painel::BaseController

  def index
    @sales = Sale.all
  end

  def new
    @sale = Sale.new
    @sale.order_product.build
  end

  def create
    @sale = Sale.new(sale_params)
    @sale.employee_id = current_user.id
    respond_to do |f|
      if @sale.save
        f.json { render json: @sale }
        f.html { redirect_to painel_sales_path }
      end
    end
  end

  def destroy
    @sale.destroy
    respond_to do |f|
      f.html { redirect_to painel_sales_path }
    end
  end

  private

    def sale_params
      params.require(:sale).permit(:payment_id, :client_id, :price, product_ids: [])
    end

    def set_sale
      @sale = Sale.find(params[:id])
    end

end