class WelcomeController < ApplicationController
  def index
    @slug     = "home"
    @articles = Article.all.shuffle
  end
end
