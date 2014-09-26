Wishlist::Application.routes.draw do
  devise_for :users
  resources :wishes
  root to: 'wishes#index'
end
