require 'test_helper'

class StreamsControllerTest < ActionController::TestCase
  setup do
    @board = boards(:one)
    @stream = streams(:one)
  end

  test "should get index" do
    get :index, params: { board_id: @board }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { board_id: @board }
    assert_response :success
  end

  test "should create stream" do
    assert_difference('Stream.count') do
      post :create, params: { board_id: @board, stream: @stream.attributes }
    end

    assert_redirected_to board_stream_path(@board, Stream.last)
  end

  test "should show stream" do
    get :show, params: { board_id: @board, id: @stream }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { board_id: @board, id: @stream }
    assert_response :success
  end

  test "should update stream" do
    put :update, params: { board_id: @board, id: @stream, stream: @stream.attributes }
    assert_redirected_to board_stream_path(@board, Stream.last)
  end

  test "should destroy stream" do
    assert_difference('Stream.count', -1) do
      delete :destroy, params: { board_id: @board, id: @stream }
    end

    assert_redirected_to board_streams_path(@board)
  end
end
