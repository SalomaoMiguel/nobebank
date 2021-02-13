class CreateContaMovimentoTipo < ActiveRecord::Migration[5.2]
  def change
    create_table :conta_movimento_tipo do |t|
      t.string :codigo, null: false
      t.string :descricao, null: false
      t.boolean :ativo, null: false, default: true

      t.timestamps
    end
  end
end
