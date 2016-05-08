require 'test_helper'

class RegistrationStepsControllerTest < ActionController::TestCase
  setup do
    @registration_step = registration_steps(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:registration_steps)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create registration_step" do
    assert_difference('RegistrationStep.count') do
      post :create, registration_step: { icon: @registration_step.icon, name: @registration_step.name, position: @registration_step.position, url: @registration_step.url }
    end

    assert_redirected_to registration_step_path(assigns(:registration_step))
  end

  test "should show registration_step" do
    get :show, id: @registration_step
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @registration_step
    assert_response :success
  end

  test "should update registration_step" do
    patch :update, id: @registration_step, registration_step: { icon: @registration_step.icon, name: @registration_step.name, position: @registration_step.position, url: @registration_step.url }
    assert_redirected_to registration_step_path(assigns(:registration_step))
  end

  test "should destroy registration_step" do
    assert_difference('RegistrationStep.count', -1) do
      delete :destroy, id: @registration_step
    end

    assert_redirected_to registration_steps_path
  end
end
