Rails.application.routes.draw do
  
  resources :welcome

  resources :users do  
    collection do
      post 'create'
      get 'createUser'
      get 'updateUser'
      post 'createUser'
      post 'updateUser'
      get 'confirm_email'
      get 'resetPassword'
      get 'newPassword'
      post 'newPassword'
      get 'setNewPassword'
      post 'setNewPassword'
      get 'enterNewPassword'
    end
  end

  resources :sessions do
    collection do
      post 'create'
      get 'destroy'
    end
  end

  resources :product do
    collection do
      get 'detail'
      get 'show'
      get 'products'
    end
  end
 
  resources :cart do 
    collection do
      get 'show'
      get 'drop'
      get 'delivery'
      post 'delivery'
      get 'add'
      post 'add'
      get 'delivery_address'
      post 'delivery_address'
      get 'confirmation'
    end
  end

  resources :order do
    collection do
      get 'detail'
      get 'history'
    end
  end
  
  resources :charges

  resources :admin do
    collection do
      get 'dashboard'
      get 'shoes'
      get 'users'
      get 'categories'
      get 'deleteUser'
      get 'editUser'
      get 'updateUser'
      post 'updateUser'
      get 'addUser'
      get 'createUser'
      post 'createUser'
      get 'deleteCategory'
      get 'editCategory'
      get 'addCategory'
      get 'createCategory'
      post 'createCategory'
      get 'updateCategory'
      post 'updateCategory'
      get 'viewOrders'
      get 'detailOrder'
      get 'brands'
      get 'addBrand'
      get 'editBrand'
      get 'deleteBrand'
      get 'createBrand'
      post 'createBrand'
      get 'updateBrand'
      post 'updateBrand'
      get 'colors'
      get 'addColor'
      get 'editColor'
      get 'deleteColor'
      get 'createColor'
      post 'createColor'
      get 'updateColor'
      post 'updateColor'
      get'sizes'
      get 'addSize'
      get 'editSize'
      get 'deleteSize'
      get 'createSize'
      post 'createSize'
      get 'updateSize'
      post 'updateSize'
      get 'addShoes'
      get 'editShoes'
      get 'deleteShoes'
      get 'viewVariants'
      get 'createShoes'
      post 'createShoes'
      get 'updateShoes'
      post 'updateShoes'
      get 'addVariants'
      get 'editVariants'
      get 'deleteVariants'
      get 'createVariants'
      post 'createVariants'
      get 'updateVariants'
      post 'updateVariants'
      get 'countries'
      get 'addCountry'
      get 'editCountry'
      get 'deleteCountry'
      get 'createCountry'
      post 'createCountry'
      get 'updateCountry'
      post 'updateCountry'
    end
  end
  
  # The priority is based upon order of creation: first created -> highest priority.
  # See how all your routes lay out with "rake routes".

  # You can have the root of your site routed with "root"
   root 'welcome#index'

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