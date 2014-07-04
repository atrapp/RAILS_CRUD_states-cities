Rails.application.routes.draw do
  
  resources :states do
    resources :cities, except: [:show, :index]
  end

end


#          Prefix Verb   URI Pattern                                 Controller#Action
#    state_cities POST   /states/:state_id/cities(.:format)          cities#create
#  new_state_city GET    /states/:state_id/cities/new(.:format)      cities#new
# edit_state_city GET    /states/:state_id/cities/:id/edit(.:format) cities#edit
#      state_city PATCH  /states/:state_id/cities/:id(.:format)      cities#update
#                 PUT    /states/:state_id/cities/:id(.:format)      cities#update
#                 DELETE /states/:state_id/cities/:id(.:format)      cities#destroy
#          states GET    /states(.:format)                           states#index
#                 POST   /states(.:format)                           states#create
#       new_state GET    /states/new(.:format)                       states#new
#      edit_state GET    /states/:id/edit(.:format)                  states#edit
#           state GET    /states/:id(.:format)                       states#show
#                 PATCH  /states/:id(.:format)                       states#update
#                 PUT    /states/:id(.:format)                       states#update
#                 DELETE /states/:id(.:format)                       states#destroy
