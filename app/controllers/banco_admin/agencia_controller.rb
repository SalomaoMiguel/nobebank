class BancoAdmin::AgenciaController < ApplicationController
  layout 'banco_admin_application'
  skip_before_action  :check_cliente_logged
  before_action :set_agencium, only: %i[ show edit update destroy ]
  before_action :set_banco

  # GET /agencia or /agencia.json
  def index
    @agencia = Agencium.all
  end

  # GET /agencia/1 or /agencia/1.json
  def show
  end

  # GET /agencia/new
  def new
    @agencium = Agencium.new
  end

  # GET /agencia/1/edit
  def edit
  end

  # POST /agencia or /agencia.json
  def create
    @agencium = Agencium.new(agencium_params)

    respond_to do |format|
      if @agencium.save
        format.html { redirect_to banco_admin_agencia_path, notice: "Agência criada com sucesso." }
        format.json { render :show, status: :created, location: @agencium }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @agencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /agencia/1 or /agencia/1.json
  def update
    respond_to do |format|
      if @agencium.update(agencium_params)
        format.html { redirect_to banco_admin_agencia_path, notice: "Agência atualizada com sucesso" }
        format.json { render :show, status: :ok, location: @agencium }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @agencium.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /agencia/1 or /agencia/1.json
  def destroy
    @agencium.destroy
    respond_to do |format|
      format.html { redirect_to banco_admin_agencia_path, notice: "Agencium was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_banco
      @banco = Banco.where("codigo = 'bank0001'").first
    end
    def set_agencium
      @agencium = Agencium.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def agencium_params
      params.require(:agencium).permit(:banco_id, :codigo, :descricao, :numero, :ativo)
    end
end
