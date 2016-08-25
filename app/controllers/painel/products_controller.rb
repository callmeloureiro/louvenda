class Painel::ProductsController < Painel::BaseController

  def index
    @products = Product.where("quantify > 0")
  end

  def new
    @product = Product.new
  end

  def show
    @product = Product.find(params[:id])
  end

  def create
    @product = Product.new(product_params)
    respond_to do |f|
      if @product.save
        f.json { render json: @product }
        f.html { redirect_to painel_products_path }
      end
    end
  end

  private

    def product_params
      params.require(:product).permit(:sku, :name, :price, :quantify, :category_id)
    end

end