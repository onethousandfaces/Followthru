class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def browse_project
  end

  def create_project
    redirect_to project_new_path
  end

  def manage_project
    redirect_to project_list_path
  end

  def about
  end
end
