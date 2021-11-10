#============ RESOURCES ==============

# nest
# les review existe a travers la table restaurant
Rails.application.routes.draw do
    resources :restaurants do
      resources :reviews, only: [:new, :create]
    end
  end


#-----------------

# member

Rails.application.routes.draw do
  resources :restaurants do
    member do                           # member => restaurant id in URL
      get 'chef'                        # RestaurantsController#chef
    end                                 # SE CONCENTRE SUR UNE RESSOURCE
  end
end

#-----------------

# collection

Rails.application.routes.draw do
    resources :restaurants do
      collection do                     # collection => no restaurant id in URL
        get 'top'                       # RestaurantsController#top
      end                               # BRASSE TOUTES LES RESSOURCES
    end
  end