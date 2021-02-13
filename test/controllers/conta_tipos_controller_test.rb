require 'test_helper'

class ContaTiposControllerTest < ActionDispatch::IntegrationTest
  setup do
    @conta_tipo = conta_tipo(:one)
  end

  test "should get index" do
    get conta_tipos_url
    assert_response :success
  end

  test "should get new" do
    get new_conta_tipo_url
    assert_response :success
  end

  test "should create conta_tipo" do
    assert_difference('ContaTipo.count') do
      post conta_tipos_url, params: { conta_tipo: { ativo: @conta_tipo.ativo, codigo: @conta_tipo.codigo, descricao: @conta_tipo.descricao } }
    end

    assert_redirected_to conta_tipo_url(ContaTipo.last)
  end

  test "should show conta_tipo" do
    get conta_tipo_url(@conta_tipo)
    assert_response :success
  end

  test "should get edit" do
    get edit_conta_tipo_url(@conta_tipo)
    assert_response :success
  end

  test "should update conta_tipo" do
    patch conta_tipo_url(@conta_tipo), params: { conta_tipo: { ativo: @conta_tipo.ativo, codigo: @conta_tipo.codigo, descricao: @conta_tipo.descricao } }
    assert_redirected_to conta_tipo_url(@conta_tipo)
  end

  test "should destroy conta_tipo" do
    assert_difference('ContaTipo.count', -1) do
      delete conta_tipo_url(@conta_tipo)
    end

    assert_redirected_to conta_tipos_url
  end
end
