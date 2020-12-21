require "application_system_test_case"

class CardsTest < ApplicationSystemTestCase
  setup do
    @card = cards(:one)
  end

  test "visiting the index" do
    visit cards_url
    assert_selector "h1", text: "Cards"
  end

  test "creating a Card" do
    visit cards_url
    click_on "New Card"

    fill_in "List", with: @card.list_id
    fill_in "Name", with: @card.name
    fill_in "Position", with: @card.position
    click_on "Create Card"

    assert_text "Card was successfully created"
    click_on "Back"
  end

  test "updating a Card" do
    visit cards_url
    click_on "Edit", match: :first

    fill_in "List", with: @card.list_id
    fill_in "Name", with: @card.name
    fill_in "Position", with: @card.position
    click_on "Update Card"

    assert_text "Card was successfully updated"
    click_on "Back"
  end

  test "destroying a Card" do
    visit cards_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Card was successfully destroyed"
  end
end
