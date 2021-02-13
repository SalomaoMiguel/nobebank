class BancoCliente::PainelClienteController < ApplicationController
  layout 'banco_cliente_application'
  skip_before_action  :check_adm_logged
  def visao_geral
  end
end
