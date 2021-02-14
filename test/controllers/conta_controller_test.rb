require 'test_helper'

class ContaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @contum = contum(:one)
  end

  test "should get index" do
    get conta_url
    assert_response :success
  end

  test "should get new" do
    get new_contum_url
    assert_response :success
  end

  test "should create contum" do
    assert_difference('Contum.count') do
      post conta_url, params: { contum: { agencium_id: @contum.agencium_id, ativo: @contum.ativo, cliente_id: @contum.cliente_id, conta_tipo_id: @contum.conta_tipo_id, dt_abertura: @contum.dt_abertura, dt_fechamento: @contum.dt_fechamento, numero: @contum.numero } }
    end

    assert_redirected_to contum_url(Contum.last)
  end

  test "should show contum" do
    get contum_url(@contum)
    assert_response :success
  end

  test "should get edit" do
    get edit_contum_url(@contum)
    assert_response :success
  end

  test "should update contum" do
    patch contum_url(@contum), params: { contum: { agencium_id: @contum.agencium_id, ativo: @contum.ativo, cliente_id: @contum.cliente_id, conta_tipo_id: @contum.conta_tipo_id, dt_abertura: @contum.dt_abertura, dt_fechamento: @contum.dt_fechamento, numero: @contum.numero } }
    assert_redirected_to contum_url(@contum)
  end

  test "should destroy contum" do
    assert_difference('Contum.count', -1) do
      delete contum_url(@contum)
    end

    assert_redirected_to conta_url
  end
end
