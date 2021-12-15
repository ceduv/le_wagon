Rails.application.routes.draw do
  mount RailsAdmin::Engine => '/admin', as: 'rails_admin'
  devise_for :users
  root to: 'pages#home'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  resources :lists, only: %I[index show new create destroy] do
    resources :marks, only: %I[new create]
  end
  resources :musics, only: %I[new create]
end
