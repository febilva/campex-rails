require 'test_helper'

class ReservationCategoriesControllerTest < ActionController::TestCase
  setup do
    @reservation_category = reservation_categories(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:reservation_categories)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create reservation_category" do
    assert_difference('ReservationCategory.count') do
      post :create, reservation_category: { name: @reservation_category.name }
    end

    assert_redirected_to reservation_category_path(assigns(:reservation_category))
  end

  test "should show reservation_category" do
    get :show, id: @reservation_category
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @reservation_category
    assert_response :success
  end

  test "should update reservation_category" do
    patch :update, id: @reservation_category, reservation_category: { name: @reservation_category.name }
    assert_redirected_to reservation_category_path(assigns(:reservation_category))
  end

  test "should destroy reservation_category" do
    assert_difference('ReservationCategory.count', -1) do
      delete :destroy, id: @reservation_category
    end

    assert_redirected_to reservation_categories_path
  end
end
