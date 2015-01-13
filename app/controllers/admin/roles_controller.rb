class Admin::RolesController < ApplicationController
  before_action :authorize
  before_action :set_slug
  before_action :set_role, only: [:show, :edit, :update, :destroy]

  def index
    @roles = Role.all
  end

  def show
  end

  def new
    @role = Role.new
  end

  def edit
  end

  def create
    @role = Role.new(role_params)
    @role.save
  end

  def update
    @role.update(role_params)
  end

  def destroy
    @role.destroy
  end

  private
    def set_slug
      @slug  = "admin"
    end

    def set_role
      @role = Role.find(params[:id])
    end

    def role_params
      params.require(:role).permit(:name)
    end
end
