Rails.application.routes.draw do
  devise_for :users

  resources :posts, only: [:index, :show] do
    resources :comments, only: [:create, :update, :destroy]

    get 'search(/:query)', to: 'posts#search', as: 'search', on: :collection
    get 'search(/:query/page/:page)', to: 'posts#search', on: :collection
    get 'page/:page', action: :index, on: :collection 
  end
    
  resources :categories, only: :show do
    get ':id(/page/:page)', to: 'categories#show', on: :collection
  end  

  resource :admin do 
    collection do
      get '/', to: 'admin#index'

      get 'posts', to: 'admin#show_all_posts'
      get 'posts(/page/:page)' => 'admin#show_all_posts'
      get 'posts/search(/:query_post)', to: 'admin#search_posts', as: 'search_posts'
      get 'posts/search(/:query_post/page/:page)' => 'admin#search_posts'
      get 'posts/new', to: 'admin#new_post', as: 'new_post'
      get 'posts/:id/edit', to: 'admin#edit_post', as: 'edit_post'

      post 'posts', to: 'admin#create_post', as: 'create_post'
      post 'posts/:id', to: 'admin#update_post', as: 'update_post'

      delete 'posts/:id', to: 'admin#destroy_post', as: 'destroy_post'

      get 'categories', to: 'admin#all_categories'
      get 'categories/new', to: 'admin#new_category', as: 'new_category'

      post 'categories', to: 'admin#create_category', as: 'create_category'
      post 'categories/:id', to: 'admin#update_category', as: 'update_category'

      delete 'categories/:id', to: 'admin#destroy_category', as: 'destroy_category'

      get 'users', to: 'admin#all_users'
      get 'users(/page/:page)' => 'admin#all_users'
      get 'users/search(/:query_user)', to: 'admin#search_users', as: 'search_users'
      get 'users/search(/:query_user/page/:page)' => 'admin#search_users'
      get 'users/new', to: 'admin#new_user', as: 'new_user'
      get 'users/:id/edit', to: 'admin#edit_user', as: 'edit_user'

      post 'users', to: 'admin#create_user', as: 'create_user'
      post 'users/:id', to: 'admin#update_user', as: 'update_user'

      delete 'users/:id', to: 'admin#destroy_user', as: 'destroy_user'

      get 'comments', to: 'admin#all_comments'
      get 'comments(/page/:page)' => 'admin#all_comments'
      get 'comments/search(/:query_comment)', to: 'admin#search_comments', as: 'search_comments'
      get 'comments/search(/:query_comment/page/:page)' => 'admin#search_comments'
      get 'comments/:id/edit', to: 'admin#edit_comment', as: 'edit_comment'

      post 'comments/:id', to: 'admin#update_comment', as: 'update_comment'

      delete 'comments/:id', to: 'admin#destroy_comment', as: 'destroy_comment'
      
    end  
  end  

  

  root 'posts#index'
  
  get 'not_found', to: 'not_found#index', as: 'not_found'

  get "*any", via: :all, to: 'not_found#index'
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
