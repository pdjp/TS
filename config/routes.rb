Rails.application.routes.draw do
  get '/' => 'home#top'
  get 'about' => 'home#about' 
  
  get 'index' => 'schedules#index'
  get 'schedules/new' => 'schedules#new'
  get 'schedules/:id' => 'schedules#show'
  post 'schedules/create' => 'schedules#create'
  get 'schedules/:id/edit' => 'schedules#edit'
  post 'schedules/:id/update' => 'schedules#update'
  post 'schedules/:id/destroy' => 'schedules#destroy'

  post 'users/:id/update' => 'users#update'
  post 'users/:id/destroy' => 'users#destroy'
  get 'users/:id/edit' => 'users#edit'
  post 'users/create' => 'users#create'
  get 'signup' => 'users#new'
  get 'users/index' => 'users#index'
  get 'users/:id' => 'users#show'

  get 'login' => 'users#login_form'
  post 'login' => 'users#login'

  post 'logout' => 'users#logout'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
