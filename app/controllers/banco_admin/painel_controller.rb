class BancoAdmin::PainelController < ApplicationController
  layout 'banco_admin_application'
  skip_before_action  :check_cliente_logged, :verify_authenticity_token
  def visao_geral
  end
end
