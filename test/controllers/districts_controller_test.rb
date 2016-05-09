require 'test_helper'

class DistrictsControllerTest < ActionController::TestCase
  setup do
    @state = states(:one)
    @district = districts(:one)
  end

  test "should get index" do
    get :index, params: { state_id: @state }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { state_id: @state }
    assert_response :success
  end

  test "should create district" do
    assert_difference('District.count') do
      post :create, params: { state_id: @state, district: @district.attributes }
    end

    assert_redirected_to state_district_path(@state, District.last)
  end

  test "should show district" do
    get :show, params: { state_id: @state, id: @district }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { state_id: @state, id: @district }
    assert_response :success
  end

  test "should update district" do
    put :update, params: { state_id: @state, id: @district, district: @district.attributes }
    assert_redirected_to state_district_path(@state, District.last)
  end

  test "should destroy district" do
    assert_difference('District.count', -1) do
      delete :destroy, params: { state_id: @state, id: @district }
    end

    assert_redirected_to state_districts_path(@state)
  end
end
