class CreateContaMovimentum < ActiveRecord::Migration[5.2]
  def change
    create_table :conta_movimentum do |t|
      t.references :contum, foreign_key: true
      t.references :conta_movimento_tipo, foreign_key: true
      t.decimal :valor_movimento

      t.timestamps
    end
  end
end
