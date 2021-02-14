require 'test_helper'

class BancoCliente::ContaMovimentoControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get banco_cliente_conta_movimento_index_url
    assert_response :success
  end

  test "should get movimento" do
    get banco_cliente_conta_movimento_movimento_url
    assert_response :success
  end

end
