class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.all
  end

  def show
    @contributor = Contributor.find_by(slug: params[:slug])
  end
end
