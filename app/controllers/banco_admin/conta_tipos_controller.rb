class BancoAdmin::ContaTiposController < ApplicationController
  layout 'banco_admin_application'
  skip_before_action  :check_cliente_logged
  before_action :set_conta_tipo, only: %i[ show edit update destroy ]

  # GET /conta_tipos or /conta_tipos.json
  def index
    @conta_tipos = ContaTipo.all
  end

  # GET /conta_tipos/1 or /conta_tipos/1.json
  def show
  end

  # GET /conta_tipos/new
  def new
    @conta_tipo = ContaTipo.new
  end

  # GET /conta_tipos/1/edit
  def edit
  end

  # POST /conta_tipos or /conta_tipos.json
  def create
    @conta_tipo = ContaTipo.new(conta_tipo_params)

    respond_to do |format|
      if @conta_tipo.save
        format.html { redirect_to banco_admin_conta_tipos_path, notice: "Tipo Conta criada com sucesso" }
        format.json { render :show, status: :created, location: @conta_tipo }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @conta_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta_tipos/1 or /conta_tipos/1.json
  def update
    respond_to do |format|
      if @conta_tipo.update(conta_tipo_params)
        format.html { redirect_to banco_admin_conta_tipos_path, notice: "Tipo de conta atualizado com sucesso." }
        format.json { render :show, status: :ok, location: @conta_tipo }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @conta_tipo.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta_tipos/1 or /conta_tipos/1.json
  def destroy
    @conta_tipo.destroy
    respond_to do |format|
      format.html { redirect_to banco_admin_conta_tipos_path, notice: "Conta tipo was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_conta_tipo
      @conta_tipo = ContaTipo.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def conta_tipo_params
      params.require(:conta_tipo).permit(:codigo, :descricao, :ativo)
    end
end
