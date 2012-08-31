class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def browse_project
    #if params.has_field?(:id)
    #else
      @projects = Project.where("status == ?", Project::ACTIVE)
    #end
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
