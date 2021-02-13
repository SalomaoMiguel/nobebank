class ApplicationController < ActionController::Base
  before_action :check_adm_logged, :check_cliente_logged, :relat_contas

  def check_adm_logged
    if session[:usuario_logged] && session[:expires_admin].to_time.try(:future?)
      @usuario_logged = BancoUser.find(session[:usuario_logged])
      session[:expires_admin] = 120.minutes.from_now
    else
      return redirect_to banco_admin_root_path
    end
  end
  def check_cliente_logged
    if session[:cliente_logged] && session[:expires_cliente].to_time.try(:future?)
      @cliente_logged = Cliente.find(session[:cliente_logged])
      session[:expires_cliente] = 120.minutes.from_now
    else
      return redirect_to banco_cliente_root_path
    end
  end
  # Tratamento de messages
  def messages(object, success='')
    object.errors.blank? ? flash[:notice] = success : flash[:error] = object.errors.full_messages.join("<br />").html_safe
  end

  def relat_contas
    @conta = Contum.joins(:agencium).order(:descricao)
  end
end
