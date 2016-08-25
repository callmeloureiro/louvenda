class Painel::BaseController < ApplicationController
  
  before_action :authenticate_user!, :funcionario?, :ativo?

  layout 'painel'

  private

    def ativo?
      unless current_user.status != false
        sign_out @user
        redirect_to previous_url(current_user)
      end
    end

    def funcionario?
      if current_user.level != 'user'
        return true
      else
        sign_out @user
        redirect_to previous_url(current_user)
      end 
    end

    def previous_url(resource)
      session[:previous_url] || painel_root_path
    end

end

