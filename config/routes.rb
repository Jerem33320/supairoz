Rails.application.routes.draw do
  devise_for :users
  root to: 'pages#home'
  resources :super_heros do
    namespace :my do
      resources :bookings, only: [:create]
    end
  end
  namespace :my do
    resources :bookings, only: [:index, :show, :edit, :destroy, :update]
  end
end
