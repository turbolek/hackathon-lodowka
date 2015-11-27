Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  resources :fridges, :products, :supplies

  root 'static_pages#index'

  post 'supplies/add_to_fridge', to: 'supplies#add_to_fridge'

end
