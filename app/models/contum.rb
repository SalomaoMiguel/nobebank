# encoding utf-8
class Contum < ApplicationRecord
  #Relacionamento
  belongs_to :agencium
  belongs_to :cliente
  belongs_to :conta_tipo
  has_many :moviments
  #Validacao
  validates :numero, :numero_transferencia, presence: true, length: { in: 12..12, message: "Não poder ser menos que e nem mais que 12 números"}
  validates :ativo, inclusion: { in: [ true, false ] }
end
