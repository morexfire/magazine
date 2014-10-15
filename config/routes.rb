Rails.application.routes.draw do
  resources :articles, :roles, :people

  root "welcome#index"


  #   namespace :admin do
  #     # Directs /admin/products/* to Admin::ProductsController
  #     # (app/controllers/admin/products_controller.rb)
  #     resources :products
  #   end
end
