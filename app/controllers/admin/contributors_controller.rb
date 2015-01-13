class Admin::ContributorsController < ApplicationController
  before_action :authorize
  before_action :set_slug
  before_action :set_contributor, only: [:show, :edit, :update, :destroy]

  def index
    @contributors = Contributor.all
  end

  def show
  end

  def new
    @contributor = Contributor.new
  end

  def edit
  end

  def create
    @contributor = Contributor.new(contributor_params)
    @contributor.save
  end

  def update
    @contributor.update(contributor_params)
  end

  def destroy
    @contributor.destroy
  end

  private
  def set_slug
    @slug  = "admin"
  end

  def set_contributor
    @contributor = Contributor.find(params[:id])
  end

  def contributor_params
    params[:contributor]
  end
end
