Rails.application.routes.draw do
  devise_for :trainers
  root to: "home#index"
  resources :trainers
  patch 'capture/:id', to: 'pokemons#capture', as: 'capture'
  patch 'damage/:id', to: 'pokemons#damage', as: 'damage'
  
  post 'trainers/:id', to: 'pokemons#create', as: 'create_pokemon'
  get 'pokemon/new', to: 'pokemons#new', as: 'new_pokemon'

end
