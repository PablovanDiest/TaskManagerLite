require 'test_helper'

class UsersControllerTest < ActionController::TestCase
  setup do
    @user = users(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:users)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create user" do
    assert_difference('User.count') do
      post :create, user: { approved_at: @user.approved_at, approved_by_id: @user.approved_by_id, created_at: @user.created_at, created_by_id: @user.created_by_id, deleted_at: @user.deleted_at, deleted_by_id: @user.deleted_by_id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, notes: @user.notes, role: @user.role, super_admin: @user.super_admin, updated_at: @user.updated_at, updated_by_id: @user.updated_by_id }
    end

    assert_redirected_to user_path(assigns(:user))
  end

  test "should show user" do
    get :show, id: @user
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @user
    assert_response :success
  end

  test "should update user" do
    patch :update, id: @user, user: { approved_at: @user.approved_at, approved_by_id: @user.approved_by_id, created_at: @user.created_at, created_by_id: @user.created_by_id, deleted_at: @user.deleted_at, deleted_by_id: @user.deleted_by_id, email: @user.email, first_name: @user.first_name, last_name: @user.last_name, notes: @user.notes, role: @user.role, super_admin: @user.super_admin, updated_at: @user.updated_at, updated_by_id: @user.updated_by_id }
    assert_redirected_to user_path(assigns(:user))
  end

  test "should destroy user" do
    assert_difference('User.count', -1) do
      delete :destroy, id: @user
    end

    assert_redirected_to users_path
  end
end
