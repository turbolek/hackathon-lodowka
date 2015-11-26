Rails.application.routes.draw do
  devise_for :users
  devise_for :views
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  root 'static_pages#index'

end
