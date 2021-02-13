require 'test_helper'

class ContaMovimentoTiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conta_movimento_tipo = conta_movimento_tipo(:one)
  end

  test "should get index" do
    get conta_movimento_tipos_url
    assert_response :success
  end

  test "should get new" do
    get new_conta_movimento_tipo_url
    assert_response :success
  end

  test "should create conta_movimento_tipo" do
    assert_difference('ContaMovimentoTipo.count') do
      post conta_movimento_tipos_url, params: { conta_movimento_tipo: { ativo: @conta_movimento_tipo.ativo, codigo: @conta_movimento_tipo.codigo, descricao: @conta_movimento_tipo.descricao } }
    end

    assert_redirected_to conta_movimento_tipo_url(ContaMovimentoTipo.last)
  end

  test "should show conta_movimento_tipo" do
    get conta_movimento_tipo_url(@conta_movimento_tipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_conta_movimento_tipo_url(@conta_movimento_tipo)
    assert_response :success
  end

  test "should update conta_movimento_tipo" do
    patch conta_movimento_tipo_url(@conta_movimento_tipo), params: { conta_movimento_tipo: { ativo: @conta_movimento_tipo.ativo, codigo: @conta_movimento_tipo.codigo, descricao: @conta_movimento_tipo.descricao } }
    assert_redirected_to conta_movimento_tipo_url(@conta_movimento_tipo)
  end

  test "should destroy conta_movimento_tipo" do
    assert_difference('ContaMovimentoTipo.count', -1) do
      delete conta_movimento_tipo_url(@conta_movimento_tipo)
    end

    assert_redirected_to conta_movimento_tipos_url
  end
end
