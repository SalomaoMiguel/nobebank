class BancoAdmin::ClienteController < ApplicationController
  layout 'banco_admin_application'
  skip_before_action  :check_cliente_logged
  def index
    @clientes = Cliente.order(:nome)
  end
  def ativar_cliente
      @cliente = Cliente.find(params[:cliente_id])
      ativo = !@cliente.ativo
      @cliente.update(ativo: ativo)
      messages(@cliente, "Situação de cliente alterado com sucesso")
      redirect_to banco_admin_cliente_index_path
  end
end
