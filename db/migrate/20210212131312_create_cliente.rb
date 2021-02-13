class CreateCliente < ActiveRecord::Migration[5.2]
  def change
    create_table :cliente do |t|
      t.string :nome, null: false
      t.date :dt_nascimento, null: false
      t.decimal :renda, null: false, default: 1
      t.string :cpf, null: false
      t.string :telefone
      t.string :celular, null: false
      t.string :email, null: false
      t.string :senha, null: false
      t.boolean :ativo, null: false, default: false

      t.timestamps
    end
  end
end
