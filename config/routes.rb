Rails.application.routes.draw do
  get 'sessions/new'

  get 'users/new'

  get 'welcome/index'
  get 'welcome/logged_in_index'

  get 'users/new'
  post 'users/create'

  get 'admin/dashboard'
  get 'admin/shoes'
  get 'admin/users'
  get 'admin/categories'
  get 'admin/deleteUser'
  get 'admin/editUser'
  get 'admin/updateUser'
  post 'admin/updateUser'
  get 'admin/addUser'
  get 'admin/createUser'
  post 'admin/createUser'
  get 'admin/deleteCategory'
  get 'admin/editCategory'
  get 'admin/addCategory'
  get 'admin/createCategory'
  post 'admin/createCategory'
  get 'admin/updateCategory'
  post 'admin/updateCategory'
  get 'admin/viewOrders'
  get 'admin/detailOrder'
  get 'admin/brands'
  get 'admin/addBrand'
  get 'admin/editBrand'
  get 'admin/deleteBrand'
  get 'admin/createBrand'
  post 'admin/createBrand'
  get 'admin/updateBrand'
  post 'admin/updateBrand'
  get 'admin/colors'
  get 'admin/addColor'
  get 'admin/editColor'
  get 'admin/deleteColor'
  get 'admin/createColor'
  post 'admin/createColor'
  get 'admin/updateColor'
  post 'admin/updateColor'
  get'admin/sizes'
  get 'admin/addSize'
  get 'admin/editSize'
  get 'admin/deleteSize'
  get 'admin/createSize'
  post 'admin/createSize'
  get 'admin/updateSize'
  post 'admin/updateSize'
  get 'admin/addShoes'
  get 'admin/editShoes'
  get 'admin/deleteShoes'
  get 'admin/viewVariants'
  get 'admin/createShoes'
  post 'admin/createShoes'
  get 'admin/updateShoes'
  post 'admin/updateShoes'
  get 'admin/addVariants'
  get 'admin/editVariants'
  get 'admin/deleteVariants'
  get 'admin/createVariants'
  post 'admin/createVariants'
  get 'admin/updateVariants'
  post 'admin/updateVariants'


  get 'users/createUser'
  post 'users/createUser'
  get 'users/updateUser'
  post 'users/updateUser'





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

   get 'product/detail'
   get 'product/products'
   get 'product/show'
   resources :product 
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

   get 'order/detail'
   get 'order/history'

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
