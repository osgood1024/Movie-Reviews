require 'test_helper'

class WatchlistsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get watchlists_new_url
    assert_response :success
  end

  test "should get create" do
    get watchlists_create_url
    assert_response :success
  end

  test "should get destroy" do
    get watchlists_destroy_url
    assert_response :success
  end

end
