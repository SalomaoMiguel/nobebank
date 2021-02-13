class BancoCliente::AuthController < ApplicationController
  layout false
  skip_before_action :check_adm_logged, :check_cliente_logged
  #GET/POST
  def login
    if request.post?
      @cliente_logged = Cliente.authentication(params[:email], params[:senha])
      if @cliente_logged
        session[:cliente_logged] = @cliente_logged.id
        session[:expires_cliente] =  10.minutes.from_now
        flash[:notice] = 'Autenticação realizada com sucesso.'
        redirect_to banco_cliente_painel_cliente_visao_geral_path
      else
        session[:cliente_logged] = nil
        reset_session
        flash[:error] = 'E-mail ou senha está incorreta.'
      end
    end
  end

  def logout
    session[:cliente_logged] = nil
    reset_session
    redirect_to root_path
  end
end
