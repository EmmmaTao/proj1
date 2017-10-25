class AddTrainerRefToPokemons < ActiveRecord::Migration[5.1]
  def change
    add_reference :pokemons, :trainer, foreign_key: true
  end
end
