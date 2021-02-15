# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
#
if Banco.all.empty?
  @banco = Banco.create(nome: "NobeBank", codigo: "bank0001")
end

if @banco
if BancoUser.all.empty?
  BancoUser.create( banco_id: @banco.id, nome: "Marcio", senha: "123456", email: "marcio@gmail.com")
end
if Agencium.all.empty?
  Agencium.create([{codigo: "MG-A", numero: "001", descricao: "Minas Gerais", banco_id: @banco.id}, {codigo: "Go-A", numero: "001", descricao: "Goias", banco_id: @banco.id}])
end
if ContaTipo.all.empty?
  ContaTipo.create([{codigo: "CC-001", descricao: "Conta-Corrente"}, {codigo: "CP-001", descricao: "Conta-Poupança"}])
end
if ContaMovimentoTipo.all.empty?
  ContaMovimentoTipo.create([{codigo: "Mov-T001", descricao: "Transferência"}, {codigo: "Mov-R001", descricao: "Retirada"}, {codigo: "Mov-D001", descricao: "Depósito"}])
end
end