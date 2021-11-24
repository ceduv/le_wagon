Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  # resources :restaurants do
  #   collection do
  #     get :top   
  #     # get /restaurants/top
  #   end
  #   member do
  #     get :chef
  #     # get /restaurants/:id/chef
  #   end
  # end

  resources :restaurants do
    resources :reviews, only: [:new, :create]
  end

  resources :reviews, only: [:destroy]

end


# reviews
# new
# create

# get /restaurants/:id/reviews/new
# post /restaurants/:id/reviews/