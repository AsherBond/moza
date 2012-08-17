Moza::Application.routes.draw do
  

  resources :articles

  resources :galleries do
    resources :comments
    resources :images
  end
  resources :images do
    resources :comments
  end

  match "discover" => "discover#index"
  match "discover/browse" => "discover#browse"

  namespace :admin do
    get 'home' => "pages#home"
  end

  resources :events do
    resources :comments
  end

  resources :videos do
    resources :comments
  end

  resources :playlists do 
    member { post :add_song_to }
  end

  resources :genres

  match 'restricted' => "exceptions#restricted", :as => :restricted

  devise_for :users, :skip => [:sessions], :controllers => { :registrations => :user_registrations }
  resources :users, :only => [:show, :index]
  resources :users do 
    resources :comments
  end
  as :user do
    get "account-artist" => "users#artist", :as => :account_type_artist
    get "account-fan" => "users#fan", :as => :account_type_fan
    get 'account-type' => 'users#type', :as => :account_type
    get 'signin' => 'devise/sessions#new', :as => :new_user_session
    post 'signin' => 'devise/sessions#create', :as => :user_session
    delete 'signout' => 'devise/sessions#destroy', :as => :destroy_user_session
  end

  resources :albums do
    member { post :vote }
    resources :comments
    resources :songs
  end
  resources :songs do 
    member { post :vote }
  end
  match 'buy/song/paypal' => "pages#paypal", :as => :paypal
  root :to => "pages#home"

  # The priority is based upon order of creation:
  # first created -> highest priority.

  # Sample of regular route:
  #   match 'products/:id' => 'catalog#view'
  # Keep in mind you can assign values other than :controller and :action

  # Sample of named route:
  #   match 'products/:id/purchase' => 'catalog#purchase', :as => :purchase
  # This route can be invoked with purchase_url(:id => product.id)

  # Sample resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Sample resource route with options:
  #   resources :products do
  #     member do
  #       get 'short'
  #       post 'toggle'
  #     end
  #
  #     collection do
  #       get 'sold'
  #     end
  #   end

  # Sample resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Sample resource route with more complex sub-resources
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', :on => :collection
  #     end
  #   end

  # Sample resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end

  # You can have the root of your site routed with "root"
  # just remember to delete public/index.html.
  # root :to => 'welcome#index'

  # See how all your routes lay out with "rake routes"

  # This is a legacy wild controller route that's not recommended for RESTful applications.
  # Note: This route will make all actions in every controller accessible via GET requests.
  # match ':controller(/:action(/:id))(.:format)'
end
