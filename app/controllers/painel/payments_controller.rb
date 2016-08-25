class Painel::PaymentsController < Painel::BaseController

  before_action :set_payment, :only => [ :destroy ]

  def index
    @payments = Payment.all
    @payment  = Payment.new
  end

  def create
    @payment = Payment.new(payment_params)
    respond_to do |f|
      if @payment.save
        f.html { redirect_to painel_payments_path }
      end
    end
  end

  def destroy
    @payment.destroy
    respond_to do |f|
      if @payment.save
        f.html { redirect_to painel_payments_path }
      end
    end
  end

  private

    def payment_params
      params.require(:payment).permit(:name)
    end

    def set_payment
      @payment = Payment.find(params[:id])
    end

end