require 'test_helper'

class CreditItemsControllerTest < ActionController::TestCase
  setup do
    @credit_item = credit_items(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:credit_items)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create credit_item" do
    assert_difference('CreditItem.count') do
      post :create, product_id: products(:ruby).id
    end

    assert_redirected_to credit_path(assigns(:credit_item).credit)
  end

  test "should show credit_item" do
    get :show, id: @credit_item
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @credit_item
    assert_response :success
  end

  test "should update credit_item" do
    put :update, id: @credit_item, credit_item: { credit_id: @credit_item.credit_id, product_id: @credit_item.product_id }
    assert_redirected_to credit_item_path(assigns(:credit_item))
  end

  test "should destroy credit_item" do
    assert_difference('CreditItem.count', -1) do
      delete :destroy, id: @credit_item
    end

    assert_redirected_to credit_items_path
  end
end
