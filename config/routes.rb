Rails.application.routes.draw do
  # TODO refactor this away
  resources :roles


  # people listings and their articles
  # TODO slug url for people#show
  resources :people, only: [:show, :index]


  # authentication
  resources :sessions
  get "logout",    to: "sessions#destroy", as: "logout"
  get "login",     to: "sessions#new",     as: "login"
  get "/sessions", to: redirect("/login")


  # homepage and footer form
  resources :feedbacks, only: [:create]
  root "welcome#index"


  # articles and archives
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
