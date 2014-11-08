class AboutController < ApplicationController
  def home
    @slug         = "home"
    @articles     = Article.all.shuffle
    @contributors = Contributor.all
  end

  def support
    @slug         = "home"
  end

  def us
    @slug         = "support"
  end
end
