class TasksController < ApplicationController
  before_filter :set_company
  before_action :set_task, only: [:show, :edit, :update, :destroy]

  # GET /tasks
  def index
    if current_user.super_admin
    else
    end
    @tasks = Task.actives.where(:created_by_id => current_user.id)
  end

  # GET /tasks/1
  def show
  end

  # GET /tasks/new
  def new
    @task = Task.new
  end

  # GET /tasks/1/edit
  def edit
  end

  # POST /tasks
  def create
    @task = Task.new(task_params)
    @task.company_id = @company.id
    @task.created_by_id = current_user.id
    if @task.save
      redirect_to company_path(@company), notice: t('scaffold.notice.created', :item => Task)
    else
      render :new
    end
  end

  # PATCH/PUT /tasks/1
  def update
    params[:task][:updated_by_id] = current_user.id.to_s
    if @task.update(task_params)
      redirect_to company_path(@company), notice: t('scaffold.notice.updated', :item => Task)
      #redirect_to @task, notice: 'Task was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tasks/1
  def destroy
    #@task.destroy
    @task.deleted_at = DateTime.now
    @task.deleted_by_id = current_user.id
    begin
      if @task.update(task_params)
        redirect_to company_path(@company), notice: t('scaffold.notice.destroyed', :item => Task)
        #redirect_to @task, notice: 'Task was successfully updated.'
      end
    rescue Exception => ex
      @task.errors.add(:base, ex.message)
    end
    #redirect_to tasks_url, notice: 'Task was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_task
      @task = Task.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def task_params
      params.require(:task).permit(:name, :company_id, :project_id, :design_document, :from, :until, :case, :case_link,
                                   :created_by_id, :created_at, :updated_by_id, :updated_at, :deleted_by_id, :deleted_at,
                                   :notes, :customer_id)
    end
end
