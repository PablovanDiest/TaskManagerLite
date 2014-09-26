class CustomersController < ApplicationController
  before_filter :set_company
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  def index
    @customers = Customer.actives.where(:company_id => @company.id).order(:name)
  end

  # GET /customers/1
  def show
  end

  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  def create
    @customer = Customer.new(customer_params)
    @customer.company_id = @company.id
    @customer.created_by_id = current_user.id
    if @customer.save
      redirect_to company_path(@company), notice: t('scaffold.notice.created', :item => Customer)
    else
      render :new
    end
  end

  # PATCH/PUT /customers/1
  def update
    params[:customer][:updated_by_id] = current_user.id.to_s
    if @customer.update(customer_params)
      redirect_to company_path(@company), notice: t('scaffold.notice.updated', :item => Customer)
    else
      render :edit
    end
  end

  # DELETE /customers/1
  def destroy
    #@customer.destroy
    @customer.deleted_at = DateTime.now
    @customer.deleted_by_id = current_user.id
    begin
      if @customer.update(customer_params)
        redirect_to company_path(@company), notice: t('scaffold.notice.destroyed', :item => Customer)
      end
    rescue Exception => ex
      @customer.errors.add(:base, ex.message)
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def customer_params
      params.require(:customer).permit(:name, :image_path, :company_id,
                                       :created_by_id, :created_at, :updated_by_id, :updated_at, :deleted_by_id, :deleted_at,
                                       :notes)
    end
end
