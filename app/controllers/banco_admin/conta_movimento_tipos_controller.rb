class BancoAdmin::ContaMovimentoTiposController < ApplicationController
  layout 'banco_admin_application'
  skip_before_action  :check_cliente_logged
  before_action :set_conta_movimento_tipo, only: %i[ show edit update destroy ]

  # GET /conta_movimento_tipos or /conta_movimento_tipos.json
  def index
    @conta_movimento_tipos = ContaMovimentoTipo.all
  end

  # GET /conta_movimento_tipos/1 or /conta_movimento_tipos/1.json
  def show
  end

  # GET /conta_movimento_tipos/new
  def new
    @conta_movimento_tipo = ContaMovimentoTipo.new
  end

  # GET /conta_movimento_tipos/1/edit
  def edit
  end

  # POST /conta_movimento_tipos or /conta_movimento_tipos.json
  def create
    @conta_movimento_tipo = ContaMovimentoTipo.new(conta_movimento_tipo_params)

    respond_to do |format|
      if @conta_movimento_tipo.save
        format.html { redirect_to banco_admin_conta_movimento_tipos_path, notice: "Tipo de movimento de conta criado com sucesso" }
        format.json { render :show, status: :created, location: @conta_movimento_tipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conta_movimento_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta_movimento_tipos/1 or /conta_movimento_tipos/1.json
  def update
    respond_to do |format|
      if @conta_movimento_tipo.update(conta_movimento_tipo_params)
        format.html { redirect_to banco_admin_conta_movimento_tipos_path, notice: "Tipo de movimento de conta atualizado com sucesso" }
        format.json { render :show, status: :ok, location: @conta_movimento_tipo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conta_movimento_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta_movimento_tipos/1 or /conta_movimento_tipos/1.json
  def destroy
    @conta_movimento_tipo.destroy
    respond_to do |format|
      format.html { redirect_to banco_admin_conta_movimento_tipos_path, notice: "Conta movimento tipo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta_movimento_tipo
      @conta_movimento_tipo = ContaMovimentoTipo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conta_movimento_tipo_params
      params.require(:conta_movimento_tipo).permit(:codigo, :descricao, :ativo)
    end
end
