class ProjectsController < ApplicationController
  def new
    @project = Project.new
  end

  def show
    @project = Project.find(params[:id])
  end

  def edit
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
    @to_do = ToDo.new
  end

  def create
    @project = Project.new(project_params)
    @todo = ToDo.new

    @project.save
    redirect_to @project
  end

  def update
    @project = Project.find(params[:id])

    @project.update(project_params)
    redirect_to @project
  end

  def destroy
    @project = Project.find(params[:id])
    @project.destroy

    redirect_to @project
  end

  private
    def project_params
      params.require(:project).permit(:title)
    end
end
