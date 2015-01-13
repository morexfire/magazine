Rails.application.routes.draw do
  # homepage and footer form
  root "about#home"
  resources :feedbacks, only: [:create] # for /contact form

  # about pages
  get "support", to: "about#support", as: :support
  get "about",   to: "about#us",      as: :about
  get "contact", to: "about#contact", as: :contact


  # authentication
  resources :sessions
  get "logout",   to: "sessions#destroy", as: :logout
  get "login",    to: "sessions#new",     as: :login
  get "sessions", to: redirect("/login")


  # contributors listings and their contributor page
  get "contributors/:slug", to: "contributors#show",  as: :contributor
  get "contributors",       to: "contributors#index", as: :contributors


  # articles and archives
  get "archives", to: "about#archives", as: :archives
  get "archive",  to: redirect("/archives")

  get ":year/:month/:day/:slug",
      to:          "articles#show",
      constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ },
      as:          :article

  get "(/:year)(/:month)(/:day)",
      to:          "articles#index",
      constraints: { year: /\d{4}/, month: /\d{2}/, day: /\d{2}/ },
      as:          :articles

  # drafts
  get "drafts/:code", to: "articles#show", as: :draft
  get "drafts",       to: redirect("/")

  # atom feed
  get "feed", to: "articles#index", defaults: { format: "atom" }, as: :feed


  # admin
  get "admin", to: redirect("/admin/roles"), as: :admin

  namespace :admin do
    # Directs /admin/roles/* to Admin::RolesController
    # (app/controllers/admin/roles_controller.rb)

    resources :roles
  end
end
