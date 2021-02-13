require "application_system_test_case"

class ContaMovimentoTiposTest < ApplicationSystemTestCase
  setup do
    @conta_movimento_tipo = conta_movimento_tipo(:one)
  end

  test "visiting the index" do
    visit conta_movimento_tipos_url
    assert_selector "h1", text: "Contamovimentotipos"
  end

  test "creating a Conta movimento tipo" do
    visit conta_movimento_tipos_url
    click_on "New Contamovimentotipo"

    check "Ativo" if @conta_movimento_tipo.ativo
    fill_in "Codigo", with: @conta_movimento_tipo.codigo
    fill_in "Descricao", with: @conta_movimento_tipo.descricao
    click_on "Create Conta movimento tipo"

    assert_text "Conta movimento tipo was successfully created"
    click_on "Back"
  end

  test "updating a Conta movimento tipo" do
    visit conta_movimento_tipos_url
    click_on "Edit", match: :first

    check "Ativo" if @conta_movimento_tipo.ativo
    fill_in "Codigo", with: @conta_movimento_tipo.codigo
    fill_in "Descricao", with: @conta_movimento_tipo.descricao
    click_on "Update Conta movimento tipo"

    assert_text "Conta movimento tipo was successfully updated"
    click_on "Back"
  end

  test "destroying a Conta movimento tipo" do
    visit conta_movimento_tipos_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Conta movimento tipo was successfully destroyed"
  end
end
