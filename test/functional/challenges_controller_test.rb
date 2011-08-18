require 'test_helper'

class ChallengesControllerTest < ActionController::TestCase
  setup do
    @challenge = challenges(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:challenges)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create challenge" do
    assert_difference('Challenge.count') do
      post :create, :challenge => @challenge.attributes
    end

    assert_redirected_to challenge_path(assigns(:challenge))
  end

  test "should show challenge" do
    get :show, :id => @challenge.to_param
    assert_response :success
  end

  test "should get edit" do
    get :edit, :id => @challenge.to_param
    assert_response :success
  end

  test "should update challenge" do
    put :update, :id => @challenge.to_param, :challenge => @challenge.attributes
    assert_redirected_to challenge_path(assigns(:challenge))
  end

  test "should destroy challenge" do
    assert_difference('Challenge.count', -1) do
      delete :destroy, :id => @challenge.to_param
    end

    assert_redirected_to challenges_path
  end
end
