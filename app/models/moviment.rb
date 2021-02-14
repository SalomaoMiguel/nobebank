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
        conta_transferencia = Contum.find_by_numero(self.numero_transferencia)
        conta_transferencia.valor = (conta_transferencia.valor + self.valor_movimento)
        conta_transferencia.save
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
  def taxa
    conta_tipo = ContaMovimentoTipo.where(id: self.conta_movimento_tipo_id)
    conta_tipo.each do |contas|
      if contas.codigo == "Mov-T001"
        conta = Contum.find(self.contum.id)
        time_agora = Time.now
        if time_agora > Time.parse('9:00am') or time_agora < Time.parse('18:00am')
          conta.valor += -5
        else
          conta.valor += -7
        if self.valor_movimento >= 1000
          conta.valor += -10
        end
        end
        conta.save
        valor = conta.valor
        taxa = valor
      end
    end
  end
end
