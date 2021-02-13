#encoding utf-8
class Cliente < ApplicationRecord
  #Relacionamento
  #Validacao
  validates :nome, presence: true, length: {maximum: 255}
  validates :email, format: { multiline: true,  with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }, presence: true, uniqueness: true
  validates :senha, length: {minimum: 6}

  #Metodo de Classe
  #Metodo de autenticacao do usuario
  def self.authentication(login, token)
    manager_user = Cliente.where(ativo:true, email: login).first
    return false unless manager_user
    return false if sha1(token) != manager_user.senha
    manager_user
  end
  before_save :crypt_password
  #Metodo para criptografia da senha
  def crypt_password
    write_attribute("senha", self.class.sha1(self.senha)) if ( !self.senha.blank? and !self.senha.nil?) and (self.senha.length < 40 && self.senha.length > 0)
  end
  protected
  def self.sha1(token)
    Digest::SHA1.hexdigest("NobeBank0001" + token)
  end
end
