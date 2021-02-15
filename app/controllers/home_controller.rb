class HomeController < ApplicationController
  skip_before_action :check_adm_logged, :check_cliente_logged
  def index
  end

  def cadastro_cliente
    if request.post?
      @cliente = Cliente.new(cliente_params)
      @cliente.nome = params[:nome]
      @cliente.email = params[:email]
      @cliente.celular = params[:celular].gsub!(/(\.|\-|\(|\))/, "")
      @cliente.cpf = params[:cpf].gsub!(/(\.|\-)/, "")
      @cliente.senha = params[:senha]
      date = Date.parse params[:dt_nascimento]
      @cliente.dt_nascimento = date.to_date
      if @cliente.save
      messages(@cliente, "Cliente criado com sucesso.")
      redirect_to root_path
      else
        messages(@cliente, "Cliente não criado")
        redirect_to root_path
    end
    end
  end

  private
  #Parametros de cliente
  def cliente_params
    params.permit(:nome, :dt_nascimento, :renda, :cpf, :telefone, :celular, :email, :senha )
  end
end


