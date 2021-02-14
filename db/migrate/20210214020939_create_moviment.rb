class CreateMoviment < ActiveRecord::Migration[5.2]
  def change
    create_table :moviment do |t|
      t.references :contum, foreign_key: true, null: false
      t.references :conta_movimento_tipo, foreign_key: true, null: false
      t.decimal :valor_movimento, null: false

      t.timestamps
    end
  end
end
