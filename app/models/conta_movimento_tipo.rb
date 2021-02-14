# encoding utf-8
class ContaMovimentoTipo < ApplicationRecord
  #Relacionamento
  has_many :moviments
  #Validacao
  validates :codigo, presence: true, length: {maximum: 255}, uniqueness: true
  validates :descricao, presence: true, length: {maximum: 255}, uniqueness: true
  validates :ativo, presence: true, inclusion: {in: [true, false]}
end
