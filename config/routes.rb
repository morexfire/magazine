Rails.application.routes.draw do
  resources :users

  # TODO refactor these away
  resources :roles, :people

  resources :feedbacks, only: [:create]

  root "welcome#index"

  get "/:year/:month/:day/:slug",
      to:          "articles#show",
      constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ },
      as:          "article"

  get "(/:year)(/:month)(/:day)",
      to:          "articles#index",
      constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ },
      as:          "articles"

  # atom feed
  get "/feed", to: "articles#index", defaults: { format: "atom" }, as: :feed


  # TODO make this
  # namespace :admin do
  #   # Directs /admin/articles/* to Admin::ArticlesController
  #   # (app/controllers/admin/articles_controller.rb)
  #   resources :articles
  # end
end
