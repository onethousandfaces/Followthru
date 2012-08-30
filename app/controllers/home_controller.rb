class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def browse_project
  end

  def create_project
  end

  def manage_project
  end

  def about
  end
end
