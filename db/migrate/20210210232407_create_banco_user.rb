class CreateBancoUser < ActiveRecord::Migration[5.2]
  def change
    create_table :banco_user do |t|
      t.string :nome, null: false
      t.string :email, null: false
      t.string :senha, null: false
      t.references :banco, foreign_key: true, null: false

      t.timestamps
    end
  end
end
