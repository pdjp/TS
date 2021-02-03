Rails.application.routes.draw do
  get "/" => "home#top"
  get "about" => "home#about" 
  
  get 'index' => 'schedules#index'
  get 'schedules/new' => 'schedules#new'
  get 'schedules/:id' => 'schedules#show'
  post 'schedules/create' => 'schedules#create'
  get 'schedules/:id/edit' => 'schedules#edit'
  post 'schedules/:id/update' => 'schedules#update'
  post "schedules/:id/destroy" => "schedules#destroy"

  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
