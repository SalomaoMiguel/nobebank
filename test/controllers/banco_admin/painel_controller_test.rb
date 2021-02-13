require 'test_helper'

class BancoAdmin::PainelControllerTest < ActionDispatch::IntegrationTest
  test "should get visao_geral" do
    get banco_admin_painel_visao_geral_url
    assert_response :success
  end

end
