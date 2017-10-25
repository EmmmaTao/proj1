class PokemonsController < ApplicationController
	def capture
		@pokemon = Pokemon.find(params[:id])
		@pokemon.trainer = current_trainer
		@pokemon.save!
		redirect_to root_path
	end

	def damage
		@pokemon = Pokemon.find(params[:id])
		@pokemon.health -= 10
		@pokemon.save!
		if @pokemon.health <= 0
			@pokemon.destroy!
		end
		redirect_to trainer_path(@pokemon.trainer_id)
	end

	def new
	end

	def create
		pokemon = Pokemon.new(name: params[:pokemon][:name], level: 1, health: 100, trainer_id: current_trainer.id)
		if not pokemon.save
			flash[:error] = pokemon.errors.full_messages.to_sentence
			redirect_to trainer_path(current_trainer)
		else
			pokemon.save!
			redirect_to trainer_path(current_trainer)
		end
	end

end
