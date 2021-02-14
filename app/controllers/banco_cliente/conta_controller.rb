class BancoCliente::ContaController < ApplicationController
  layout 'banco_cliente_application'
  skip_before_action  :check_adm_logged
  before_action :set_contum, only: %i[ show edit update destroy encerrar_conta]
  before_action :load_relations

  # GET /conta or /conta.json
  def index
    @conta = @cliente_logged.contums.order(:dt_abertura)
  end

  # GET /conta/1 or /conta/1.json
  def show
  end

  # GET /conta/new
  def new
    @contum = Contum.new
  end

  # GET /conta/1/edit
  def edit
  end
  def encerrar_conta
    @contum = Contum.find(params[:id])
    if @contum.ativo
      @contum.update(ativo:false)
    else
      @contum.update(ativo:true)
    end
    respond_to do |format|
      format.html { redirect_to banco_cliente_conta_path, notice: 'Conta alterada com sucesso' }
      format.json { head :no_content }
    end
  end
  # POST /conta or /conta.json
  def create
    @contum = Contum.new(contum_params)
    @contum.dt_abertura = Date.current.to_date
    @contum.numero = rand.to_s[2..13]
    respond_to do |format|
      if @contum.save
        format.html { redirect_to banco_cliente_conta_path, notice: "Conta criada com sucesso." }
        format.json { render :show, status: :created, location: @contum }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @contum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /conta/1 or /conta/1.json
  def update
    respond_to do |format|
      if @contum.update(contum_params)
        format.html { redirect_to banco_cliente_conta_path, notice: "Conta alterada com sucesso." }
        format.json { render :show, status: :ok, location: @contum }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @contum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /conta/1 or /conta/1.json
  def destroy
    @contum.destroy
    respond_to do |format|
      format.html { redirect_to banco_cliente_conta_path, notice: "Conta encerrada com sucesso." }
      format.json { head :no_content }
    end
  end

  private
  #Cerregar dados de outra tabela
  def load_relations
    @agencias = Agencium.where(ativo: true).order(:descricao)
    @conta_tipos = ContaTipo.where(ativo: true).order(:descricao)
  end
    # Use callbacks to share common setup or constraints between actions.
    def set_contum
      @contum = Contum.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def contum_params
      params.require(:contum).permit(:agencium_id, :cliente_id, :conta_tipo_id, :numero, :dt_abertura, :dt_fechamento, :ativo, :valor)
    end
end
