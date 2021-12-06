Rails.application.routes.draw do
  devise_for :devs
  resources :quests
  resources :users
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :points

  root 'points#index'
  # get '/points' => 'points#index'
  # get '/points/:id' => 'points#show'
  # get '/points/new' => 'points#new'
  # post '/points' => 'points#create'
  # get '/points/:id/edit' => 'points#edit'
  # post '/points/:id' => 'points#update'
  # delete '/points/:id' => 'points#destroy'


  resources :tests

  # get '/tests/list' => 'tests#list'
  # get '/tests/:id/edit' => 'tests#edit'
  # get '/tests/new' => 'tests#new'
  # post '/tests/new' => 'tests#create'
  # get '/tests/:id' => 'tests#show'
  # put '/tests/:id' => 'tests#update'
  # delete '/tests/:id' => 'tests#destroy'




end
