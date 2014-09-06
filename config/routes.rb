Rails.application.routes.draw do
  resources :managers, only: :create do
    resources :drivers, except: [:new, :edit, :update] do
      resources :readings, except: [:new, :edit, :update, :destroy]
    end
  end
end
