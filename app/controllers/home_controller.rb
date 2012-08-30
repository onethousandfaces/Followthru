class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def create_project
  end

  def about
  end
end
