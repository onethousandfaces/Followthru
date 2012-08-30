class ProjectControlController < ApplicationController
  def new
  end
  def list
  end
  def view
    @id = params[:id]
  end
  def delete
    @id = params[:id]
  end
  def edit
    @id = params[:id]
  end
end
