Rails.application.routes.draw do
  resources :managers, only: :create
  resources :drivers, except: [:new, :edit, :update]
  resources :readings, except: [:new, :edit, :update, :destroy]

  post 'login' => 'sessions#create'
  delete 'logout' => 'sessions#destroy'

  post 'token' => 'drivers#token'
end
