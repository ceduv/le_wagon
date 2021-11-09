#========= ROUTER ============

# cli

rails routes

# configurer le router de maniere a
# ce qu il traite ces requetes

root to: 'pages#home'

get 'about', to: 'pages#about'
get 'team', to: 'pages#contact', as: :contact
get 'contact' => 'pages#contact'
# verb path       controller#action


#===

# un link
<%= link_to "our_contact", contact_path %>
<%= link_to "Home", root_path %>

