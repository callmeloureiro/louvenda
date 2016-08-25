class Painel::CategoriesController < Painel::BaseController

  before_action :set_category, :only => [ :edit, :update, :destroy ]

  def index
    @category = Category.new
    @categories = Category.all
  end

  def create
    @category = Category.new(category_params)
    respond_to do |f|
      if @category.save
        f.html { redirect_to painel_categories_path }
      end
    end
  end

  def edit
  end

  def update
    respond_to do |f|
      if @category.update_attributes(category_params)
        f.html { redirect_to painel_categories_path }
      end
    end
  end

  def destroy
    @category.destroy
    respond_to do |f|
      f.html { redirect_to painel_categories_path }
    end
  end

  private

    def category_params
      params.require(:category).permit(:name)
    end

    def set_category
      @category = Category.find(params[:id])
    end

end