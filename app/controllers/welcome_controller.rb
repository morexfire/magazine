class WelcomeController < ApplicationController
  def index
    @slug     = "home"
    @articles = Article.all.shuffle
    @people   = Person.all
  end
end
