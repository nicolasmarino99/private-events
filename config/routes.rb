Rails.application.routes.draw do
  root 'static_pages#home'
  get 'static_pages/organize'
  get 'static_pages/help'
  get 'static_pages/create_event'
  get    '/login',   to: 'sessions#new'
  post   '/login',   to: 'sessions#create'
  delete '/logout',  to: 'sessions#destroy'
  resources :attendances
  resources :users
  resources :events
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
