Celog::Application.routes.draw do
  resources :ces

  devise_for :users
  root :to => 'visitors#new'
end
