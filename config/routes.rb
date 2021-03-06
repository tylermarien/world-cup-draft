Rails.application.routes.draw do
  namespace :admin do
    get 'countries/import', to: 'countries#import', as: 'import_countries'
    get 'matches/import', to: 'matches#import', as: 'import_matches'
    get 'players/import', to: 'players#import', as: 'import_players'
    get 'teams/calculate_totals', to: 'teams#calculate_totals', as: 'calculate_totals'

    resources :countries, :matches, :players, :teams
  end

  devise_for :users
  root 'welcome#index'

  get '/countries/most_popular', to: 'countries#most_popular', as: 'most_popular_countries'
  get '/countries/:id', to: 'countries#show', as: 'country'

  get '/players/most_popular', to: 'players#most_popular', as: 'most_popular_players'
  get '/players/top_scorers', to: 'players#top_scorers', as: 'top_scorers'
  get '/players/:id', to: 'players#show', as: 'player'

  get '/teams/:id', to: 'teams#show', as: 'team'

  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
  # root 'welcome#index'

  # Example of regular route:
  #   get 'products/:id' => 'catalog#view'

  # Example of named route that can be invoked with purchase_url(id: product.id)
  #   get 'products/:id/purchase' => 'catalog#purchase', as: :purchase

  # Example resource route (maps HTTP verbs to controller actions automatically):
  #   resources :products

  # Example resource route with options:
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

  # Example resource route with sub-resources:
  #   resources :products do
  #     resources :comments, :sales
  #     resource :seller
  #   end

  # Example resource route with more complex sub-resources:
  #   resources :products do
  #     resources :comments
  #     resources :sales do
  #       get 'recent', on: :collection
  #     end
  #   end

  # Example resource route with concerns:
  #   concern :toggleable do
  #     post 'toggle'
  #   end
  #   resources :posts, concerns: :toggleable
  #   resources :photos, concerns: :toggleable

  # Example resource route within a namespace:
  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
