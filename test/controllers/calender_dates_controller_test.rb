require 'test_helper'

class CalenderDatesControllerTest < ActionController::TestCase
  setup do
    @calender_date = calender_dates(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:calender_dates)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create calender_date" do
    assert_difference('CalenderDate.count') do
      post :create, calender_date: {  }
    end

    assert_redirected_to calender_date_path(assigns(:calender_date))
  end

  test "should show calender_date" do
    get :show, id: @calender_date
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @calender_date
    assert_response :success
  end

  test "should update calender_date" do
    patch :update, id: @calender_date, calender_date: {  }
    assert_redirected_to calender_date_path(assigns(:calender_date))
  end

  test "should destroy calender_date" do
    assert_difference('CalenderDate.count', -1) do
      delete :destroy, id: @calender_date
    end

    assert_redirected_to calender_dates_path
  end
end
