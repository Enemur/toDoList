class ToDosController < ApplicationController
  def create
    @project = Project.find(params[:to_do][:project_id])
    @to_do = @project.to_dos.create(to_do_params)

    redirect_to projects_index_path
  end

  def index
    @project = Project.find(params[:to_do][:project_id])
    @to_dos = @project.to_dos

    redirect_to projects_index_path
  end

  def update
    @project = Project.find(params[:to_do][:project_id])
    @to_do = @project.to_dos.find(params[:id])

    @to_do.update(to_do_params)

    redirect_to projects_index_path
  end

  def destroy
    @project = Project.find(params[:to_do][:project_id])
    @to_do = @project.to_dos.find(params[:id])
    @to_do.destroy

    redirect_to projects_index_path
  end

  private
    def to_do_params
      params.require(:to_do).permit(:text, :isCompleted, :project_id)
    end
end
