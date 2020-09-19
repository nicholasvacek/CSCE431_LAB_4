require 'test_helper'

class ProjectControllerTest < ActionDispatch::IntegrationTest
  test "should get HomePage" do
    get project_HomePage_url
    assert_response :success
  end

  test "should get AddABookPage" do
    get project_AddABookPage_url
    assert_response :success
  end

  test "should get UpdateABookPage" do
    get project_UpdateABookPage_url
    assert_response :success
  end

  test "should get ShowDetailsPage" do
    get project_ShowDetailsPage_url
    assert_response :success
  end

  test "should get DeletePage" do
    get project_DeletePage_url
    assert_response :success
  end

end
