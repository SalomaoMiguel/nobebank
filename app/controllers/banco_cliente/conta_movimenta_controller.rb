class BancoCliente::ContaMovimentaController < ApplicationController
  layout 'banco_cliente_application'
  before_action :load_relations
  def index
    @conta_movimentos = @cliente_logged.conta_movimentum.joins(:conta_movimento_tipo).order(:descricao)
  end

  def new
    @conta_movimento = ContaMovimentum.new
  end

  def movimenta
    @conta_movimento = ContaMovimentum.new
    if request.post?
      @conta_movimento.contum_id = params[:contum_id]
      @conta_movimento.conta_movimento_tipo_id = params[:conta_movimento_tipo_id]
      @conta_movimento.valor_movimento = params[:valor_movimento]
      @conta_movimento.tipo_movimentacao
      @conta_movimento.save
      redirect_to banco_cliente_conta_movimenta_index_path
  end
  end
  protected
  # Use callbacks to share common setup or constraints between actions.
  def set_contum_movimento
    @conta_movimento = ContaMovimentum.find(params[:id])
  end

  def load_relations
    @contas = @cliente_logged.contums.order(:descricao)
    @conta_movimento_tipos = ContaMovimentoTipo.order(:descricao)
  end
end
