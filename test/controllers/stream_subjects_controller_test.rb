require 'test_helper'

class StreamSubjectsControllerTest < ActionController::TestCase
  setup do
    @stream = streams(:one)
    @stream_subject = stream_subjects(:one)
  end

  test "should get index" do
    get :index, params: { stream_id: @stream }
    assert_response :success
  end

  test "should get new" do
    get :new, params: { stream_id: @stream }
    assert_response :success
  end

  test "should create stream_subject" do
    assert_difference('StreamSubject.count') do
      post :create, params: { stream_id: @stream, stream_subject: @stream_subject.attributes }
    end

    assert_redirected_to stream_stream_subject_path(@stream, StreamSubject.last)
  end

  test "should show stream_subject" do
    get :show, params: { stream_id: @stream, id: @stream_subject }
    assert_response :success
  end

  test "should get edit" do
    get :edit, params: { stream_id: @stream, id: @stream_subject }
    assert_response :success
  end

  test "should update stream_subject" do
    put :update, params: { stream_id: @stream, id: @stream_subject, stream_subject: @stream_subject.attributes }
    assert_redirected_to stream_stream_subject_path(@stream, StreamSubject.last)
  end

  test "should destroy stream_subject" do
    assert_difference('StreamSubject.count', -1) do
      delete :destroy, params: { stream_id: @stream, id: @stream_subject }
    end

    assert_redirected_to stream_stream_subjects_path(@stream)
  end
end
