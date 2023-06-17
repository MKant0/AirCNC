Rails.application.routes.draw do
  devise_for :users
  root to: "pages#home"
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  resources :pages
  # Defines the root path route ("/")
  # root "articles#index"

  get 'bookings/download_information', to: 'bookings#download_information', as: 'download_information'

  resources :chairs do
    resources :bookings, only: [:new, :create]
  end
  resources :bookings, only: [:index, :show, :edit, :update, :destroy]
end
