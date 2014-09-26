class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  def index
    @companies = Company.all.order(:name)
    #unless current_user.super_admin
      redirect_to company_path(current_user.company)
    #end
  end

  # GET /companies/1
  def show
    @tasks = Task.actives.where(:company_id => @company.id).order(:from)
    @customers = Customer.actives.where(:company_id => @company.id).order(:name)
    @projects = Project.actives.where(:company_id => @company.id).order(:name)
    @task = Task.new
    @customer = Customer.new
    @project = Project.new
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  def create
    @company = Company.new(company_params)

    if @company.save
      redirect_to @company, notice: 'Company was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /companies/1
  def update
    if @company.update(company_params)
      redirect_to @company, notice: 'Company was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /companies/1
  def destroy
    @company.destroy
    redirect_to companies_url, notice: 'Company was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def company_params
      params.require(:company).permit(:name, :image_path, :created_by_id, :created_at, :updated_by_id, :updated_at, :deleted_by_id, :deleted_at, :notes)
    end
end
