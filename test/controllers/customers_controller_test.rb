require 'test_helper'

class CustomersControllerTest < ActionController::TestCase
  setup do
    @customer = customers(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:customers)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create customer" do
    assert_difference('Customer.count') do
      post :create, customer: { created_at: @customer.created_at, created_by_id: @customer.created_by_id, deleted_at: @customer.deleted_at, deleted_by_id: @customer.deleted_by_id, image_path: @customer.image_path, name: @customer.name, notes: @customer.notes, updated_at: @customer.updated_at, updated_by_id: @customer.updated_by_id }
    end

    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should show customer" do
    get :show, id: @customer
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @customer
    assert_response :success
  end

  test "should update customer" do
    patch :update, id: @customer, customer: { created_at: @customer.created_at, created_by_id: @customer.created_by_id, deleted_at: @customer.deleted_at, deleted_by_id: @customer.deleted_by_id, image_path: @customer.image_path, name: @customer.name, notes: @customer.notes, updated_at: @customer.updated_at, updated_by_id: @customer.updated_by_id }
    assert_redirected_to customer_path(assigns(:customer))
  end

  test "should destroy customer" do
    assert_difference('Customer.count', -1) do
      delete :destroy, id: @customer
    end

    assert_redirected_to customers_path
  end
end
