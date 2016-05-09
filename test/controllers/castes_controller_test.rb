require 'test_helper'

class CastesControllerTest < ActionController::TestCase
  setup do
    @reservation_category = reservation_categories(:one)
    @caste = castes(:one)
  end

  test "should get index" do
    get :index, params: { reservation_category_id: @reservation_category }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { reservation_category_id: @reservation_category }
    assert_response :success
  end

  test "should create caste" do
    assert_difference('Caste.count') do
      post :create, params: { reservation_category_id: @reservation_category, caste: @caste.attributes }
    end

    assert_redirected_to reservation_category_caste_path(@reservation_category, Caste.last)
  end

  test "should show caste" do
    get :show, params: { reservation_category_id: @reservation_category, id: @caste }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { reservation_category_id: @reservation_category, id: @caste }
    assert_response :success
  end

  test "should update caste" do
    put :update, params: { reservation_category_id: @reservation_category, id: @caste, caste: @caste.attributes }
    assert_redirected_to reservation_category_caste_path(@reservation_category, Caste.last)
  end

  test "should destroy caste" do
    assert_difference('Caste.count', -1) do
      delete :destroy, params: { reservation_category_id: @reservation_category, id: @caste }
    end

    assert_redirected_to reservation_category_castes_path(@reservation_category)
  end
end
