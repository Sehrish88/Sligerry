Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  root 'pages#home' 
  get 'about', to: 'pages#about'
  get '/login', to: 'sessions#new'
  post '/login', to: 'sessions#create'
  post '/logout', to: 'sessions#destroy'

  resources :instructors
  resources :schedules 
  resources :courses 
  resources :instructors do
    resources :courses    
  end 
  
  
 
end
