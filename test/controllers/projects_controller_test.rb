require 'test_helper'

class ProjectsControllerTest < ActionController::TestCase
  setup do
    @project = projects(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:projects)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create project" do
    assert_difference('Project.count') do
      post :create, project: { company_id: @project.company_id, created_at: @project.created_at, created_by_id: @project.created_by_id, deleted_at: @project.deleted_at, deleted_by_id: @project.deleted_by_id, file_name: @project.file_name, file_path: @project.file_path, name: @project.name, notes: @project.notes, updated_at: @project.updated_at, updated_by_id: @project.updated_by_id }
    end

    assert_redirected_to project_path(assigns(:project))
  end

  test "should show project" do
    get :show, id: @project
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @project
    assert_response :success
  end

  test "should update project" do
    patch :update, id: @project, project: { company_id: @project.company_id, created_at: @project.created_at, created_by_id: @project.created_by_id, deleted_at: @project.deleted_at, deleted_by_id: @project.deleted_by_id, file_name: @project.file_name, file_path: @project.file_path, name: @project.name, notes: @project.notes, updated_at: @project.updated_at, updated_by_id: @project.updated_by_id }
    assert_redirected_to project_path(assigns(:project))
  end

  test "should destroy project" do
    assert_difference('Project.count', -1) do
      delete :destroy, id: @project
    end

    assert_redirected_to projects_path
  end
end
