Rails.application.routes.draw do
  devise_for :users
  root to: 'super_heros#index'
  resources :super_heros, except: [:index] do
    namespace :my do
      resources :bookings, only: [:create]
    end
  end
  namespace :my do
    resources :bookings, only: [:index, :show, :edit, :destroy, :update]
  end
end
