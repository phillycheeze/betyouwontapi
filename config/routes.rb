Rails.application.routes.draw do
  resources :managers, only: :create do
    resources :drivers, except: [:new, :edit, :update]
  end
end
