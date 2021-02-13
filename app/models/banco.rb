#encoding utf-8
class Banco < ApplicationRecord
  #Relacionamento
  has_many :banco_users
  has_many :agenciums
  #Validacao
  validates :nome, presence: true, length: {maximum: 255}
  validates :codigo, presence: true, length: {maximum: 255}, uniqueness: true
end
