require 'test_helper'

class BancoCliente::PainelClienteControllerTest < ActionDispatch::IntegrationTest
  test "should get visao_geral" do
    get banco_cliente_painel_cliente_visao_geral_url
    assert_response :success
  end

end
