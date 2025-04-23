class AddTokenToHeroes < ActiveRecord::Migration[8.0]
  def change
    add_column :heroes, :token, :string, null: false
    add_index :heroes, :token
  end
end
