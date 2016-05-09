require 'test_helper'

class StatesControllerTest < ActionController::TestCase
  setup do
    @country = countries(:one)
    @state = states(:one)
  end

  test "should get index" do
    get :index, params: { country_id: @country }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { country_id: @country }
    assert_response :success
  end

  test "should create state" do
    assert_difference('State.count') do
      post :create, params: { country_id: @country, state: @state.attributes }
    end

    assert_redirected_to country_state_path(@country, State.last)
  end

  test "should show state" do
    get :show, params: { country_id: @country, id: @state }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { country_id: @country, id: @state }
    assert_response :success
  end

  test "should update state" do
    put :update, params: { country_id: @country, id: @state, state: @state.attributes }
    assert_redirected_to country_state_path(@country, State.last)
  end

  test "should destroy state" do
    assert_difference('State.count', -1) do
      delete :destroy, params: { country_id: @country, id: @state }
    end

    assert_redirected_to country_states_path(@country)
  end
end
