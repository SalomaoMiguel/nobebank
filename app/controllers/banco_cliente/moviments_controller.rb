class BancoCliente::MovimentsController < ApplicationController
  layout 'banco_cliente_application'
  skip_before_action  :check_adm_logged
  before_action :set_moviment, only: %i[ show edit update destroy ]
  before_action :load_relations

  # GET /moviments or /moviments.json
  def index
    @moviments = @cliente_logged.contums
  end

  # GET /moviments/1 or /moviments/1.json
  def show
  end

  # GET /moviments/new
  def new
    @moviment = Moviment.new
  end

  # GET /moviments/1/edit
  def edit
  end
  #GET /moeviments/extract_moviment

  def extract_moviment
    if params[:filtro]
      dt_inicio = Date.parse params[:filtro][:dt_ini] rescue nil
      dt_final = Date.parse params[:filtro][:dt_fim] rescue nil
      @dt_inicio = dt_inicio
      @dt_final = dt_final
      message_erro = ""
      message_erro += " Data Inicio ou Data final não pode ser vazio" if (dt_inicio.nil? or dt_final.nil?)
      message_erro += " Data Inicio  não pode ser maior que  Data final" if message_erro.blank? and (dt_inicio.to_date > dt_final.to_date)
      message_erro += " Data não pode conter mais que 31 dias" if message_erro.blank? and  ((dt_final - dt_inicio).to_i > 31)
      if  !message_erro.blank?
        flash[:error] = message_erro
        @moviments = []
      else
        condicoes = "true"
        condicoes += " and dt_emisaao >= '#{dt_inicio}' and dt_emisaao <= '#{dt_final}' "
        @moviments = Moviment.where(condicoes).order(:dt_emisaao)
      end
    else
      @moviments = Moviment.order(:dt_emisaao)
    end
  end
  # POST /moviments or /moviments.json
  def create
    @moviment = Moviment.new(moviment_params)

    respond_to do |format|
      @moviment.dt_emisaao = Date.today.to_date.to_s
      @moviment.tipo_movimentacao
      @moviment.taxa
      if @moviment.save
        format.html { redirect_to banco_cliente_moviments_path, notice: "Moviment was successfully created." }
        format.json { render :show, status: :created, location: @moviment }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @moviment.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /moviments/1 or /moviments/1.json
  def update
    respond_to do |format|
      if @moviment.update(moviment_params)
        format.html { redirect_to banco_cliente_moviments_path, notice: "Moviment was successfully updated." }
        format.json { render :show, status: :ok, location: @moviment }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @moviment.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /moviments/1 or /moviments/1.json
  def destroy
    @moviment.destroy
    respond_to do |format|
      format.html { redirect_to moviments_url, notice: "Moviment was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_moviment
      @moviment = Moviment.find(params[:id])
    end

  def load_relations
    @contas = @cliente_logged.contums.order(:descricao)
    @conta_movimento_tipos = ContaMovimentoTipo.order(:descricao)
  end
    # Only allow a list of trusted parameters through.
    def moviment_params
      params.require(:moviment).permit(:contum_id, :conta_movimento_tipo_id, :valor_movimento, :numero_transferencia, :dt_emisaao)
    end
end
