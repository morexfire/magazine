class ContributorsController < ApplicationController
  def index
    @slug         = "everyone"
    @contributors = Contributor.all
  end

  def show
    @slug        = "contributor"
    @contributor = Contributor.find_by(slug: params[:slug])
  end
end
