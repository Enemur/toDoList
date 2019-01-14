class ToDosController < ApplicationController
  def create
    @project = Project.find(params[:project_id])
    @to_do = @project.to_dos.create(to_do_params)

    redirect_to projects_index_path
  end

  def index
    @project = Project.find(params[:project_id])
    @to_dos = @project.to_dos

    redirect_to projects_index_path
  end

  def update
    @to_do = ToDo.find(params[:id])

    @to_do.update(isCompleted: params[:isCompleted])

    redirect_to projects_index_path
  end

  private
    def to_do_params
      params.require(:to_do).permit(:text, :isCompleted)
    end
end
