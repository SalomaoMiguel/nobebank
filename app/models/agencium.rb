#encoding utf-8
class Agencium < ApplicationRecord
  #Relacionamento
  belongs_to :banco
  has_many :contums
  #Validacao
  validates :descricao, presence: true, length: {maximum: 250}
  validates :codigo, presence: true, length: {maximum: 255}, uniqueness: true
  validates :numero, presence: true, length: {maximum: 255}
  validates :ativo, presence: true, inclusion: {in: [true, false]}
end
