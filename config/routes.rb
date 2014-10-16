Rails.application.routes.draw do
  resources :articles, :roles, :people

  # atom feed
  get "/feed", to: "articles#index", defaults: { format: "atom" }, as: :feed

  root "welcome#index"

  get "(/:year)(/:month)(/:day)", to: "articles#index"

  # namespace :admin do
  #   # Directs /admin/products/* to Admin::ProductsController
  #   # (app/controllers/admin/products_controller.rb)
  #   resources :products
  # end
end
