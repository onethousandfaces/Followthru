class HomeController < ApplicationController

  def index
    @users = User.all
  end

  def browse_project
    @projects = Project.where("status == ?", Project::ACTIVE)
  end

  # Different to the projects_controller because this one is not limited to owner only.
  def show_project
    @project = Project.find(params[:id])
    @id = @project.id
    respond_to do |format|
      format.html { render 'project_control/view' }
      format.json { render json: @project }
    end
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
