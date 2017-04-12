Rails.application.routes.draw do
  get 'meetings/alert_confirm' => 'meetings#alert_confirm'
  resources :meetings, :except => [:index, :show, :destroy, :edit]
  resources :users, :except => [:index, :show, :destroy, :edit]

  #Used to send alerts
  post 'meetings/send_alert' => 'meetings#send_alert', as: 'send_alert'

  post 'meetings/meeting_ok' => 'meetings#meeting_ok', as: 'meeting_ok'

  post 'meetings/add_time' => 'meetings#add_time', as: 'add_time'

  # Used to update location to meeting, basic HTML-form does not support PUT
  post 'meetings/:id' => 'meetings#update'

  post 'users' => 'users#receive_phone'

  root 'meetings#new'

  get 'meeting' => 'meetings#show'

  get 'credits' => 'users#out_of_credits'

  # Used to check if the given meeting exists
  get 'meetings/exists/:id' => 'meetings#exists'

  get 'meetings' => 'meetings#new'

  get 'admin' => 'admins#index', as: 'admin'

  delete 'admin/delete/:id' => 'admins#destroy'

  get 'users' => 'users#phone_form'

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
