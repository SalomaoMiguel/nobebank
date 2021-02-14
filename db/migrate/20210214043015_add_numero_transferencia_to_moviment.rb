class AddNumeroTransferenciaToMoviment < ActiveRecord::Migration[5.2]
  def change
    add_column :moviment, :numero_transferencia, :string
  end
end
