class CreateContum < ActiveRecord::Migration[5.2]
  def change
    create_table :contum do |t|
      t.references :agencium, foreign_key: true, null: false
      t.references :cliente, foreign_key: true, null: false
      t.references :conta_tipo, foreign_key: true, null: false
      t.string :numero, null: false
      t.date :dt_abertura, null: false
      t.date :dt_fechamento
      t.boolean :ativo, null: false, default: true

      t.timestamps
    end
  end
end
