require "application_system_test_case"

class ContaTest < ApplicationSystemTestCase
  setup do
    @contum = contum(:one)
  end

  test "visiting the index" do
    visit conta_url
    assert_selector "h1", text: "Conta"
  end

  test "creating a Contum" do
    visit conta_url
    click_on "New Contum"

    fill_in "Agencium", with: @contum.agencium_id
    check "Ativo" if @contum.ativo
    fill_in "Cliente", with: @contum.cliente_id
    fill_in "Conta tipo", with: @contum.conta_tipo_id
    fill_in "Dt abertura", with: @contum.dt_abertura
    fill_in "Dt fechamento", with: @contum.dt_fechamento
    fill_in "Numero", with: @contum.numero
    click_on "Create Contum"

    assert_text "Contum was successfully created"
    click_on "Back"
  end

  test "updating a Contum" do
    visit conta_url
    click_on "Edit", match: :first

    fill_in "Agencium", with: @contum.agencium_id
    check "Ativo" if @contum.ativo
    fill_in "Cliente", with: @contum.cliente_id
    fill_in "Conta tipo", with: @contum.conta_tipo_id
    fill_in "Dt abertura", with: @contum.dt_abertura
    fill_in "Dt fechamento", with: @contum.dt_fechamento
    fill_in "Numero", with: @contum.numero
    click_on "Update Contum"

    assert_text "Contum was successfully updated"
    click_on "Back"
  end

  test "destroying a Contum" do
    visit conta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Contum was successfully destroyed"
  end
end
