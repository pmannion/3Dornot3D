require 'test_helper'

class TradesControllerTest < ActionController::TestCase
  setup do
    @trade = trades(:one)
  end

  test "requires item in credit" do
    get :new
    assert_redirected_to :controller => "store", :action => "most_wanted"
    assert_equal flash[:notice], "You have not selected any items"
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:trades)
  end

  test "should get new" do
    credit = Credit.create
    session[:credit_id] = credit.id
    CreditItem.create(credit: credit, product: products(:ruby))

    get :new
    assert_response :success
  end

  test "should create trade" do
    assert_difference('Trade.count') do
      post :create, trade: { address: @trade.address, email: @trade.email, name: @trade.name }
    end

    assert_redirected_to trade_path(assigns(:trade))
  end

  test "should show trade" do
    get :show, id: @trade
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @trade
    assert_response :success
  end

  test "should update trade" do
    put :update, id: @trade, trade: { address: @trade.address, email: @trade.email, name: @trade.name }
    assert_redirected_to trade_path(assigns(:trade))
  end

  test "should destroy trade" do
    assert_difference('Trade.count', -1) do
      delete :destroy, id: @trade
    end

    assert_redirected_to trades_path
  end
end
