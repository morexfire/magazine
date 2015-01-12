class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.all
  end

  def show
    @contributor  = Contributor.find_by(slug: params[:slug])
    @articles     = Article.published.shuffle # TODO do the right lookup here
    @contributors = Contributor.all
  end
end
