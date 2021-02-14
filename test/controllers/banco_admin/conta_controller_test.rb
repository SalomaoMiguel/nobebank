require 'test_helper'

class BancoAdmin::ContaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get banco_admin_conta_index_url
    assert_response :success
  end

  test "should get gerenciar_conta" do
    get banco_admin_conta_gerenciar_conta_url
    assert_response :success
  end

end
