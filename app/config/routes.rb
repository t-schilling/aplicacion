Rails.application.routes.draw do
  devise_for :users
  get 'home/index'
  resources :restaurants do
    resources :platos
    resources :comentariors

  end
  resources :restaurants do
    resources :ordens
  end
  root "home#index"

end
