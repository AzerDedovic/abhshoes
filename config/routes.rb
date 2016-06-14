Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'welcome/index'
  get 'welcome/logged_in_index'
  get 'users/new'
  post 'users/create'


  get 'sessinos/new' #=> 'sessinons#new'
  post 'sessions/create' #=> 'session#create'
  get 'sessions/destroy' #=> 'session#destroy'
  resources :users
  #get 'login' => 'sessions#new'
  #post 'login' => 'sessions#create'
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

   get 'product/show'
   get 'product/detail'
   get 'cart/show'
   post 'cart/add'
   get 'cart/add'
   get 'cart/delivery'
   get 'cart/delivery_address'
   post 'cart/delivery_address'
   get 'cart/confirmation'
   post 'cart/delivery'
   get'cart/drop'

   resources :charges
   get 'charges/create'
   post 'charges/create'

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
