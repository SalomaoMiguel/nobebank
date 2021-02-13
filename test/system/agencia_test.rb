require "application_system_test_case"

class AgenciaTest < ApplicationSystemTestCase
  setup do
    @agencium = agencium(:one)
  end

  test "visiting the index" do
    visit agencia_url
    assert_selector "h1", text: "Agencia"
  end

  test "creating a Agencium" do
    visit agencia_url
    click_on "New Agencium"

    check "Ativo" if @agencium.ativo
    fill_in "Banco", with: @agencium.banco_id
    fill_in "Codigo", with: @agencium.codigo
    fill_in "Descricao", with: @agencium.descricao
    fill_in "Numero", with: @agencium.numero
    click_on "Create Agencium"

    assert_text "Agencium was successfully created"
    click_on "Back"
  end

  test "updating a Agencium" do
    visit agencia_url
    click_on "Edit", match: :first

    check "Ativo" if @agencium.ativo
    fill_in "Banco", with: @agencium.banco_id
    fill_in "Codigo", with: @agencium.codigo
    fill_in "Descricao", with: @agencium.descricao
    fill_in "Numero", with: @agencium.numero
    click_on "Update Agencium"

    assert_text "Agencium was successfully updated"
    click_on "Back"
  end

  test "destroying a Agencium" do
    visit agencia_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Agencium was successfully destroyed"
  end
end
