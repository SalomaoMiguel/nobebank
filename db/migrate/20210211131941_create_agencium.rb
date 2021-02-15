class CreateAgencium < ActiveRecord::Migration[5.2]
  def change
    create_table :agencium do |t|
      t.references :banco, foreign_key: true
      t.string :codigo, null: false
      t.string :descricao, null: false
      t.string :numero, null: false
      t.boolean :ativo, null: false, default: true

      t.timestamps
    end
  end
end
