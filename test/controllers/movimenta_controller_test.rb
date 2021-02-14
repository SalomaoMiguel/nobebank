require 'test_helper'

class MovimentaControllerTest < ActionDispatch::IntegrationTest
  setup do
    @movimentum = movimentum(:one)
  end

  test "should get index" do
    get movimenta_url
    assert_response :success
  end

  test "should get new" do
    get new_movimentum_url
    assert_response :success
  end

  test "should create movimentum" do
    assert_difference('Movimentum.count') do
      post movimenta_url, params: { movimentum: { conta_movimento_tipo_id: @movimentum.conta_movimento_tipo_id, contum_id: @movimentum.contum_id, valor_movimento_id: @movimentum.valor_movimento_id } }
    end

    assert_redirected_to movimentum_url(Movimentum.last)
  end

  test "should show movimentum" do
    get movimentum_url(@movimentum)
    assert_response :success
  end

  test "should get edit" do
    get edit_movimentum_url(@movimentum)
    assert_response :success
  end

  test "should update movimentum" do
    patch movimentum_url(@movimentum), params: { movimentum: { conta_movimento_tipo_id: @movimentum.conta_movimento_tipo_id, contum_id: @movimentum.contum_id, valor_movimento_id: @movimentum.valor_movimento_id } }
    assert_redirected_to movimentum_url(@movimentum)
  end

  test "should destroy movimentum" do
    assert_difference('Movimentum.count', -1) do
      delete movimentum_url(@movimentum)
    end

    assert_redirected_to movimenta_url
  end
end
