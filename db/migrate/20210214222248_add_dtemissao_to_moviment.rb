class AddDtemissaoToMoviment < ActiveRecord::Migration[5.2]
  def change
    add_column :moviment, :dt_emisaao, :date
  end
end
