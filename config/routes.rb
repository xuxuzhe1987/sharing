Rails.application.routes.draw do
  devise_for :users
  root to: 'items#index'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html

  resources :items do
    collection do
      get :my_items
    end
  end

  resources :bookings, only: [:show, :new, :create] do
    collection do
      get :my_bookings
    end
  end

end
