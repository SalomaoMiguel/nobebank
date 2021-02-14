require 'test_helper'

class MovimentsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @moviment = moviment(:one)
  end

  test "should get index" do
    get moviments_url
    assert_response :success
  end

  test "should get new" do
    get new_moviment_url
    assert_response :success
  end

  test "should create moviment" do
    assert_difference('Moviment.count') do
      post moviments_url, params: { moviment: { conta_movimento_tipo_id: @moviment.conta_movimento_tipo_id, contum_id: @moviment.contum_id, valor_movimento: @moviment.valor_movimento } }
    end

    assert_redirected_to moviment_url(Moviment.last)
  end

  test "should show moviment" do
    get moviment_url(@moviment)
    assert_response :success
  end

  test "should get edit" do
    get edit_moviment_url(@moviment)
    assert_response :success
  end

  test "should update moviment" do
    patch moviment_url(@moviment), params: { moviment: { conta_movimento_tipo_id: @moviment.conta_movimento_tipo_id, contum_id: @moviment.contum_id, valor_movimento: @moviment.valor_movimento } }
    assert_redirected_to moviment_url(@moviment)
  end

  test "should destroy moviment" do
    assert_difference('Moviment.count', -1) do
      delete moviment_url(@moviment)
    end

    assert_redirected_to moviments_url
  end
end
