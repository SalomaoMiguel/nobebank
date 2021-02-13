# encoding utf-8
class ContaTipo < ApplicationRecord
  #Relacionamento
  has_many :contums
  #Validacao
  validates :codigo, presence: true, length: {maximum: 255}, uniqueness: true
  validates :descricao, presence: true, length: {maximum: 255}
  validates :ativo, presence: true, inclusion: {in: [true, false]}
end
