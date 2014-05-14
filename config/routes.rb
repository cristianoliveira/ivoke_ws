IvokeComBr::Application.routes.draw do

  get  'places/get_nearby/:latitude/:longitude/:distance' => 'places#get_nearby'
  post 'places/get_nearby' => 'places#get_nearby'
  resources :places

  resources :debugs
  
  get  'users/registre_google_device/:user_id/:device_reg_id' => 'users#registre_google_device';
  post 'users/registre_google_device' => 'users#registre_google_device'; 
  
  get  'users/unregistre_google_device/:user_id/:device_reg_id' => 'users#unregistre_google_device';
  post 'users/unregistre_google_device' => 'users#unregistre_google_device'; 
  
  get  'users/get_google_devices/:user_id' => 'users#get_google_devices';
  post 'users/get_google_devices' => 'users#get_google_devices'; 
  
  get  'users/existe' => 'users#existe';
  post 'users/existe' => 'users#existe'; 
  resources :users

  get  'mural_posts/get_nearby/:lat_lng_distance'   => 'mural_posts#get_nearby';
  post 'mural_posts/delete'                         => 'mural_posts#delete'
  resources :mural_posts

  post 'debug/log' => 'usuarios#set_localizacao'; 
  
  get  'conversation_messages/get/:conversation_id'   => 'conversation_messages#get_by_conversation'
  post 'conversation_messages/get/'                   => 'conversation_messages#get_by_conversation'
  resources :conversation_messages
  get  'conversations/from_user/:user_id'             => 'conversations#get_by_user'
  post 'conversations/from_user/'                     => 'conversations#get_by_user'
  resources :conversations
 
  get  'gcm/send_message/:to_user_id/:message'        => 'gcm#send_message'
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
