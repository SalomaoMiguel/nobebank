class ContaMovimentum < ApplicationRecord
  belongs_to :contum
  belongs_to :conta_movimento_tipo
  #Validacao
  # Metodo de Classe
  def tipo_movimentacao
    conta_tipo = ContaMovimentoTipo.where(id: self.conta_movimento_tipo_id)
    conta_tipo.each do |contas|
    if contas.codigo == "Mov-T001"
      conta = Contum.find(self.contum.id)
      valor = conta.valor - self.valor_movimento
      conta.save
      if contas.codigo == "Mov-S001"
        conta = Contum.find(self.contum.id)
        valor = conta.valor - self.valor_movimento
        conta.save
      end
    else
      if contas.codigo == "Mov-D001"
        conta = Contum.find(self.contum.id)
        valor = conta.valor + self.valor_movimento
        conta.save
      end
      end
    end
  end
end
