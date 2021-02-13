require "application_system_test_case"

class BancoUsersTest < ApplicationSystemTestCase
  setup do
    @banco_user = banco_user(:one)
  end

  test "visiting the index" do
    visit banco_users_url
    assert_selector "h1", text: "Bancousers"
  end

  test "creating a Banco user" do
    visit banco_users_url
    click_on "New Bancouser"

    fill_in "Banco", with: @banco_user.banco_id
    fill_in "Email", with: @banco_user.email
    fill_in "Nome", with: @banco_user.nome
    fill_in "Senha", with: @banco_user.senha
    click_on "Create Banco user"

    assert_text "Banco user was successfully created"
    click_on "Back"
  end

  test "updating a Banco user" do
    visit banco_users_url
    click_on "Edit", match: :first

    fill_in "Banco", with: @banco_user.banco_id
    fill_in "Email", with: @banco_user.email
    fill_in "Nome", with: @banco_user.nome
    fill_in "Senha", with: @banco_user.senha
    click_on "Update Banco user"

    assert_text "Banco user was successfully updated"
    click_on "Back"
  end

  test "destroying a Banco user" do
    visit banco_users_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Banco user was successfully destroyed"
  end
end
