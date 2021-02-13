require "application_system_test_case"

class ContaTiposTest < ApplicationSystemTestCase
  setup do
    @conta_tipo = conta_tipo(:one)
  end

  test "visiting the index" do
    visit conta_tipos_url
    assert_selector "h1", text: "Contatipos"
  end

  test "creating a Conta tipo" do
    visit conta_tipos_url
    click_on "New Contatipo"

    check "Ativo" if @conta_tipo.ativo
    fill_in "Codigo", with: @conta_tipo.codigo
    fill_in "Descricao", with: @conta_tipo.descricao
    click_on "Create Conta tipo"

    assert_text "Conta tipo was successfully created"
    click_on "Back"
  end

  test "updating a Conta tipo" do
    visit conta_tipos_url
    click_on "Edit", match: :first

    check "Ativo" if @conta_tipo.ativo
    fill_in "Codigo", with: @conta_tipo.codigo
    fill_in "Descricao", with: @conta_tipo.descricao
    click_on "Update Conta tipo"

    assert_text "Conta tipo was successfully updated"
    click_on "Back"
  end

  test "destroying a Conta tipo" do
    visit conta_tipos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conta tipo was successfully destroyed"
  end
end
