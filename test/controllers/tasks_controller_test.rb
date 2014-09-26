require 'test_helper'

class TasksControllerTest < ActionController::TestCase
  setup do
    @task = tasks(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:tasks)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create task" do
    assert_difference('Task.count') do
      post :create, task: { case: @task.case, case_link: @task.case_link, company_id: @task.company_id, company_id: @task.company_id, created_at: @task.created_at, created_by_id: @task.created_by_id, deleted_at: @task.deleted_at, deleted_by_id: @task.deleted_by_id, design_document: @task.design_document, from: @task.from, name: @task.name, notes: @task.notes, project_id: @task.project_id, until: @task.until, updated_at: @task.updated_at, updated_by_id: @task.updated_by_id }
    end

    assert_redirected_to task_path(assigns(:task))
  end

  test "should show task" do
    get :show, id: @task
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @task
    assert_response :success
  end

  test "should update task" do
    patch :update, id: @task, task: { case: @task.case, case_link: @task.case_link, company_id: @task.company_id, company_id: @task.company_id, created_at: @task.created_at, created_by_id: @task.created_by_id, deleted_at: @task.deleted_at, deleted_by_id: @task.deleted_by_id, design_document: @task.design_document, from: @task.from, name: @task.name, notes: @task.notes, project_id: @task.project_id, until: @task.until, updated_at: @task.updated_at, updated_by_id: @task.updated_by_id }
    assert_redirected_to task_path(assigns(:task))
  end

  test "should destroy task" do
    assert_difference('Task.count', -1) do
      delete :destroy, id: @task
    end

    assert_redirected_to tasks_path
  end
end
