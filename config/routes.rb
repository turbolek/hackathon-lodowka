Rails.application.routes.draw do

  resources :fridges

  root 'static_pages#index'

end
