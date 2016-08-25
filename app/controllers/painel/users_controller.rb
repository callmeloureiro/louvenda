class Painel::UsersController < Painel::BaseController

  before_action :set_users, :only => [ :update, :show, :updatepassword ]
  # before_filter :validate_user, :only => :show

  def index
    @users = User.where(:level => 0)
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params_create)
    respond_to do |format|
      if @user.save
        format.json { render json: @user }
        format.html { redirect_to painel_users_path }
      end
    end
  end

  def show

  end

  def updatepassword
    respond_to do |f|
      if @user.update_attributes(user_params_update_password)
        f.html { redirect_to painel_user_path }
      end
    end
  end

  def update
    respond_to do |format|
      if @user.update_attributes(user_params_update)
        format.html { redirect_to painel_user_path }
      end
    end
  end

  private

    def validate_user
      redirect_to :controller => 'users', :action => 'show', :id => current_user unless current_user.id.to_s == params[:id]
    end

    def user_params_update
      params.require(:user).permit(:name, :birthday, :telephone, :cellphone, :email, :CEP, :address_line, :number, :district, :city, :state, :status)
    end

    def user_params_update_password
      params.require(:user).permit(:password, :password_confirmation, :current_password)
    end

    def user_params_create
      params.require(:user).permit(:name, :cpf, :birthday, :telephone, :cellphone, :email, :password, :password_confirmation, :CEP, :address_line, :number, :district, :city, :state, :status)
    end

    def set_users
      @user = User.find(params[:id])
    end

end
