class AboutController < ApplicationController
  def archives
    @slug     = "the-archives"
    @articles = Article.all
  end

  def contact
    @slug     = "contact"
    @feedback = Feedback.new
  end

  def home
    @slug         = "home"
    @articles     = Article.published.shuffle # TODO do the right lookup here
    @contributors = Contributor.all
  end

  def support
    @slug = "home"
  end

  def us
    @slug = "about"
  end
end
