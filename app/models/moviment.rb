class Moviment < ApplicationRecord
  belongs_to :contum
  belongs_to :conta_movimento_tipo
  #Validacao
  # Metodo de Classe
  def tipo_movimentacao
    manager = false
    conta_tipo = ContaMovimentoTipo.where(id: self.conta_movimento_tipo_id)
    conta_tipo.each do |contas|
      if contas.codigo == "Mov-T001"
        conta = Contum.find(self.contum.id)
        conta.valor = conta.valor - self.valor_movimento
        if conta.valor <= 0
          conta.valor = (self.valor_movimento * 0.2) / 100
        end
        manager = conta
      else
        if contas.codigo == "Mov-R001"
          conta = Contum.find(self.contum.id)
          conta.valor = conta.valor - self.valor_movimento
          if conta.valor <= 0
            conta.valor = (self.valor_movimento * 0.2) / 100
          end
          manager = conta
        else
          if contas.codigo == "Mov-D001"
            conta = Contum.find(self.contum.id)
            valor = conta.valor + self.valor_movimento
            conta.valor = valor
            manager = conta
          end
        end
      end
      manager.save
    end
  end
end
