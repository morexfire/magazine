class ContributorsController < ApplicationController
  def index
    @contributors = Contributor.all
  end

  def show
    @contributor = Contributor.find(params[:slug])
  end
end
