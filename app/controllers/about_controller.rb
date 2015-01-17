class AboutController < ApplicationController
  def archives
    @slug     = "the-archives"
    @articles = Article.published
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
    @slug = "about"
  end

  def us
    @slug = "about"
  end
end
