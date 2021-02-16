class BancoCliente::PainelClienteController < ApplicationController
  layout 'banco_cliente_application'
  skip_before_action  :check_adm_logged
  before_action :load_relations
  def visao_geral

  end

  protected
  def load_relations
    @contums = @cliente_logged.contums.where("ativo = true").order(:conta_valor)
    @moviments = Moviment.order(:dt_emisaao)
  end
end
