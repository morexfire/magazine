class AdminController < ApplicationController
  def index
    @slug  = "admin"
    @title = "Admin Dashboard"
  end
end
