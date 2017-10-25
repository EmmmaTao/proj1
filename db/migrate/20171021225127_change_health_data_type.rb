class ChangeHealthDataType < ActiveRecord::Migration[5.1]
  def change
  	change_column :pokemons, :health, :integer
  end
end
