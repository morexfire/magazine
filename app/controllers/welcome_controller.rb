class WelcomeController < ApplicationController
  def index
    @slug         = "home"
    @articles     = Article.all.shuffle
    @contributors = Contributor.all
  end
end
