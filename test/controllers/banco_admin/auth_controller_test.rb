require 'test_helper'

class BancoAdmin::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get banco_admin_auth_login_url
    assert_response :success
  end

  test "should get logout" do
    get banco_admin_auth_logout_url
    assert_response :success
  end

end
