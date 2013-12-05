Wishlist::Application.routes.draw do
  devise_for :users
  resources :wishes
end
