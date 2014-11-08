class AboutController < ApplicationController
  def archives
    @slug         = "archives"
  end

  def contact
    @slug         = "contact"
  end

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
