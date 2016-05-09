require 'test_helper'

class GuardiansControllerTest < ActionController::TestCase
  setup do
    @guardian = guardians(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:guardians)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create guardian" do
    assert_difference('Guardian.count') do
      post :create, guardian: { address_line1: @guardian.address_line1, address_line2: @guardian.address_line2, annual_income: @guardian.annual_income, country_id: @guardian.country_id, district_id: @guardian.district_id, email: @guardian.email, gender: @guardian.gender, mobile_no: @guardian.mobile_no, name: @guardian.name, occupation_id: @guardian.occupation_id, phone_no: @guardian.phone_no, pincode: @guardian.pincode, post_office: @guardian.post_office, qualification_id: @guardian.qualification_id, relationship: @guardian.relationship, state_id: @guardian.state_id, student_id: @guardian.student_id, taluk: @guardian.taluk }
    end

    assert_redirected_to guardian_path(assigns(:guardian))
  end

  test "should show guardian" do
    get :show, id: @guardian
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @guardian
    assert_response :success
  end

  test "should update guardian" do
    patch :update, id: @guardian, guardian: { address_line1: @guardian.address_line1, address_line2: @guardian.address_line2, annual_income: @guardian.annual_income, country_id: @guardian.country_id, district_id: @guardian.district_id, email: @guardian.email, gender: @guardian.gender, mobile_no: @guardian.mobile_no, name: @guardian.name, occupation_id: @guardian.occupation_id, phone_no: @guardian.phone_no, pincode: @guardian.pincode, post_office: @guardian.post_office, qualification_id: @guardian.qualification_id, relationship: @guardian.relationship, state_id: @guardian.state_id, student_id: @guardian.student_id, taluk: @guardian.taluk }
    assert_redirected_to guardian_path(assigns(:guardian))
  end

  test "should destroy guardian" do
    assert_difference('Guardian.count', -1) do
      delete :destroy, id: @guardian
    end

    assert_redirected_to guardians_path
  end
end
