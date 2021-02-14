require "application_system_test_case"

class MovimentaTest < ApplicationSystemTestCase
  setup do
    @movimentum = movimentum(:one)
  end

  test "visiting the index" do
    visit movimenta_url
    assert_selector "h1", text: "Movimenta"
  end

  test "creating a Movimentum" do
    visit movimenta_url
    click_on "New Movimentum"

    fill_in "Conta movimento tipo", with: @movimentum.conta_movimento_tipo_id
    fill_in "Contum", with: @movimentum.contum_id
    fill_in "Valor movimento", with: @movimentum.valor_movimento_id
    click_on "Create Movimentum"

    assert_text "Movimentum was successfully created"
    click_on "Back"
  end

  test "updating a Movimentum" do
    visit movimenta_url
    click_on "Edit", match: :first

    fill_in "Conta movimento tipo", with: @movimentum.conta_movimento_tipo_id
    fill_in "Contum", with: @movimentum.contum_id
    fill_in "Valor movimento", with: @movimentum.valor_movimento_id
    click_on "Update Movimentum"

    assert_text "Movimentum was successfully updated"
    click_on "Back"
  end

  test "destroying a Movimentum" do
    visit movimenta_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Movimentum was successfully destroyed"
  end
end
