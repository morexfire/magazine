class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.all
  end

  def show
    @contributor  = Contributor.find_by(slug: params[:slug])
    @articles     = Article.all.shuffle
    @contributors = Contributor.all
  end
end
