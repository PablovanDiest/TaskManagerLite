class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  before_filter :is_allowed?

  protected
  def set_company
    @company = Company.find(params[:company_id])
  end

  def is_allowed?
    ("#{controller_name}##{action_name}" == 'companies#get_by_contributor_number') || authenticate_user!
  end

end
