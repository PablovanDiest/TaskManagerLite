require 'test_helper'

class CompaniesControllerTest < ActionController::TestCase
  setup do
    @company = companies(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:companies)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create company" do
    assert_difference('Company.count') do
      post :create, company: { created_at: @company.created_at, created_by_id: @company.created_by_id, deleted_at: @company.deleted_at, deleted_by_id: @company.deleted_by_id, image_path: @company.image_path, name: @company.name, notes: @company.notes, updated_at: @company.updated_at, updated_by_id: @company.updated_by_id }
    end

    assert_redirected_to company_path(assigns(:company))
  end

  test "should show company" do
    get :show, id: @company
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @company
    assert_response :success
  end

  test "should update company" do
    patch :update, id: @company, company: { created_at: @company.created_at, created_by_id: @company.created_by_id, deleted_at: @company.deleted_at, deleted_by_id: @company.deleted_by_id, image_path: @company.image_path, name: @company.name, notes: @company.notes, updated_at: @company.updated_at, updated_by_id: @company.updated_by_id }
    assert_redirected_to company_path(assigns(:company))
  end

  test "should destroy company" do
    assert_difference('Company.count', -1) do
      delete :destroy, id: @company
    end

    assert_redirected_to companies_path
  end
end
