Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items do
    collection do
      get :my_items
    end
    resources :bookings, only: [:new, :create]
  end

  resources :bookings, only: [:show, :edit, :update] do
    collection do
      get :my_bookings
    end
  end

end
