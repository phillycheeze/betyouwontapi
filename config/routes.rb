Rails.application.routes.draw do
  resources :managers, only: :create
  resources :drivers, except: [:new, :edit, :update]
  resources :readings, only: :create

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'token' => 'drivers#token'
end
