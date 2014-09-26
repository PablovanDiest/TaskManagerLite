class ProjectsController < ApplicationController
  before_filter :set_company
  before_action :set_project, only: [:show, :edit, :update, :destroy]

  # GET /projects
  def index
    @projects = Project.all
  end

  # GET /projects/1
  def show
  end

  # GET /projects/new
  def new
    @project = Project.new
  end

  # GET /projects/1/edit
  def edit
  end

  # POST /projects
  def create
    @project = Project.new(project_params)
    @project.company_id = @company.id
    @project.created_by_id = current_user.id
    if @project.save
      redirect_to company_path(@company), notice: t('scaffold.notice.created', :item => Project)
    else
      render :new
    end
  end

  # PATCH/PUT /projects/1
  def update
    if @project.update(project_params)
      redirect_to @project, notice: 'Project was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /projects/1
  def destroy
    @project.destroy
    redirect_to projects_url, notice: 'Project was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_project
      @project = Project.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def project_params
      params.require(:project).permit(:name, :company_id, :file_path, :file_name,
                                      :created_by_id, :created_at, :updated_by_id, :updated_at, :deleted_by_id, :deleted_at,
                                      :notes)
    end
end
