class CreateBanco < ActiveRecord::Migration[5.2]
  def change
    create_table :banco do |t|
      t.string :nome, null: false
      t.string :codigo, null: false

      t.timestamps
    end
  end
end
