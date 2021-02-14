class BancoAdmin::ContaController < ApplicationController
  layout 'banco_admin_application'
  skip_before_action  :check_cliente_logged
  def index

  end

  def gerenciar_conta
    @contum = Contum.find(params[:id])
    if @contum.ativo
      @contum.update(ativo:false)
    else
      @contum.update(ativo:true)
    end
    respond_to do |format|
      format.html { redirect_to banco_admin_conta_index_path, notice: 'Conta alterada com sucesso' }
      format.json { head :no_content }
    end
  end
end
