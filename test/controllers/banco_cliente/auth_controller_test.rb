require 'test_helper'

class BancoCliente::AuthControllerTest < ActionDispatch::IntegrationTest
  test "should get login" do
    get banco_cliente_auth_login_url
    assert_response :success
  end

  test "should get logout" do
    get banco_cliente_auth_logout_url
    assert_response :success
  end

end
