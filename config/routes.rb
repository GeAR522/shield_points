Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  get '/list/points' => 'application#list_points'
  get '/show_point/:id' => 'application#show_point'
  get '/new_point' => 'application#new_point'
  post '/create_point' => 'application#create_point'
  get '/edit_point/:id' => 'application#edit_point'
  post '/update_point/:id' => 'application#update_point'
  post '/delete_point/:id' => 'application#delete_point'



end
