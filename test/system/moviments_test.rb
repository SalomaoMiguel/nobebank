require "application_system_test_case"

class MovimentsTest < ApplicationSystemTestCase
  setup do
    @moviment = moviment(:one)
  end

  test "visiting the index" do
    visit moviments_url
    assert_selector "h1", text: "Moviments"
  end

  test "creating a Moviment" do
    visit moviments_url
    click_on "New Moviment"

    fill_in "Conta movimento tipo", with: @moviment.conta_movimento_tipo_id
    fill_in "Contum", with: @moviment.contum_id
    fill_in "Valor movimento", with: @moviment.valor_movimento
    click_on "Create Moviment"

    assert_text "Moviment was successfully created"
    click_on "Back"
  end

  test "updating a Moviment" do
    visit moviments_url
    click_on "Edit", match: :first

    fill_in "Conta movimento tipo", with: @moviment.conta_movimento_tipo_id
    fill_in "Contum", with: @moviment.contum_id
    fill_in "Valor movimento", with: @moviment.valor_movimento
    click_on "Update Moviment"

    assert_text "Moviment was successfully updated"
    click_on "Back"
  end

  test "destroying a Moviment" do
    visit moviments_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Moviment was successfully destroyed"
  end
end
