class BancoAdmin::AuthController < ApplicationController
  layout false
  skip_before_action :check_adm_logged, :check_cliente_logged
  #GET/POST
  def login
    if request.post?
      @usuario_logged = BancoUser.authentication(params[:email], params[:senha])
      if @usuario_logged
        session[:usuario_logged] = @usuario_logged.id
        session[:expires_admin] =  10.minutes.from_now
        flash[:notice] = 'Autenticação realizada com sucesso.'
        redirect_to banco_admin_painel_visao_geral_path
      else
        session[:usuario_logged] = nil
        reset_session
        flash[:error] = 'E-mail ou senha está incorreta.'
      end
    end
  end

  def logout
    session[:usuario_logged] = nil
    reset_session
    redirect_to root_path
  end
end
