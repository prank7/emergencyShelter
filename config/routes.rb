Rails.application.routes.draw do

  get 'user/index'

  get 'user/edit'

  get 'user/show'

  get 'user/destroy'


  get 'user/api_destroy'

  get 'user/api_edit'

  get '/auth/:provider/callback', to: 'session#create',  via: [:post, :get]
  match "/api/android/auth", to: 'session#auth', via: [:post, :get]
  match "/api/shelters", to: 'static_page#api_shelters', via: [:post, :get]

  match "/api/users/", to: 'user#api_index', via: [:get]
  match "/api/users/:id", to: 'user#api_show', via: [:get]
  match "/api/users/:id", to: 'user#api_edit', via: [:put]
  match "/api/users/:id", to: 'user#api_index', via: [:delete]



  root 'static_page#index'
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
