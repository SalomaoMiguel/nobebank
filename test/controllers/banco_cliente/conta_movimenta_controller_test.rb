require 'test_helper'

class BancoCliente::ContaMovimentaControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get banco_cliente_conta_movimenta_index_url
    assert_response :success
  end

  test "should get new" do
    get banco_cliente_conta_movimenta_new_url
    assert_response :success
  end

  test "should get movimenta" do
    get banco_cliente_conta_movimenta_movimenta_url
    assert_response :success
  end

end
