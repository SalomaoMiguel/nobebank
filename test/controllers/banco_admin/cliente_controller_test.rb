require 'test_helper'

class BancoAdmin::ClienteControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get banco_admin_cliente_index_url
    assert_response :success
  end

  test "should get gerenciar_cliente" do
    get banco_admin_cliente_gerenciar_cliente_url
    assert_response :success
  end

end
