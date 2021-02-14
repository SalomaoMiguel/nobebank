class AddValorToContum < ActiveRecord::Migration[5.2]
  def change
    add_column :contum, :valor, :decimal
  end
end
