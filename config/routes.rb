Rails.application.routes.draw do
  resources :managers, only: :create
  resources :drivers, except: [:new, :edit, :update]
  resources :readings, except: [:new, :edit, :update, :destroy]
end
