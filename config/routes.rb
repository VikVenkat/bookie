Bookie::Application.routes.draw do
  devise_for :users

  get "home/index"

  resources :challenges
  resources :hookups
  
  put 'challenges/:id/complete' => 'challenges#complete', :as => 'complete_challenge'
   
  get 'challenges/:id/getpic' => 'challenges#getpic', :as => 'getpic' 
  
  #match '/hookups' => 'hookups#index'
  

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
   root :to => "home#index"

  # See how all your routes lay out with "rake routes"

end
