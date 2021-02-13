require 'test_helper'

class BancoUsersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @banco_user = banco_user(:one)
  end

  test "should get index" do
    get banco_users_url
    assert_response :success
  end

  test "should get new" do
    get new_banco_user_url
    assert_response :success
  end

  test "should create banco_user" do
    assert_difference('BancoUser.count') do
      post banco_users_url, params: { banco_user: { banco_id: @banco_user.banco_id, email: @banco_user.email, nome: @banco_user.nome, senha: @banco_user.senha } }
    end

    assert_redirected_to banco_user_url(BancoUser.last)
  end

  test "should show banco_user" do
    get banco_user_url(@banco_user)
    assert_response :success
  end

  test "should get edit" do
    get edit_banco_user_url(@banco_user)
    assert_response :success
  end

  test "should update banco_user" do
    patch banco_user_url(@banco_user), params: { banco_user: { banco_id: @banco_user.banco_id, email: @banco_user.email, nome: @banco_user.nome, senha: @banco_user.senha } }
    assert_redirected_to banco_user_url(@banco_user)
  end

  test "should destroy banco_user" do
    assert_difference('BancoUser.count', -1) do
      delete banco_user_url(@banco_user)
    end

    assert_redirected_to banco_users_url
  end
end
