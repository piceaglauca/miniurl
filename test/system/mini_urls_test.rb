require "application_system_test_case"

class MiniUrlsTest < ApplicationSystemTestCase
  setup do
    @mini_url = mini_urls(:one)
  end

  test "visiting the index" do
    visit mini_urls_url
    assert_selector "h1", text: "Mini Urls"
  end

  test "creating a Mini url" do
    visit mini_urls_url
    click_on "New Mini Url"

    fill_in "Full url", with: @mini_url.full_url
    fill_in "Short url", with: @mini_url.short_url
    click_on "Create Mini url"

    assert_text "Mini url was successfully created"
    click_on "Back"
  end

  test "updating a Mini url" do
    visit mini_urls_url
    click_on "Edit", match: :first

    fill_in "Full url", with: @mini_url.full_url
    fill_in "Short url", with: @mini_url.short_url
    click_on "Update Mini url"

    assert_text "Mini url was successfully updated"
    click_on "Back"
  end

  test "destroying a Mini url" do
    visit mini_urls_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Mini url was successfully destroyed"
  end
end
