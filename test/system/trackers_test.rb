require "application_system_test_case"

class TrackersTest < ApplicationSystemTestCase
  setup do
    @tracker = trackers(:one)
  end

  test "visiting the index" do
    visit trackers_url
    assert_selector "h1", text: "Trackers"
  end

  test "should create tracker" do
    visit trackers_url
    click_on "New tracker"

    fill_in "Amount", with: @tracker.amount
    fill_in "Brand", with: @tracker.brand
    fill_in "Date", with: @tracker.date
    fill_in "Description", with: @tracker.description
    fill_in "Favorite score", with: @tracker.favorite_score
    fill_in "Feeding time", with: @tracker.feeding_time
    fill_in "Left amount", with: @tracker.left_amount
    fill_in "Pet", with: @tracker.pet_id
    fill_in "Time of eat back and forth", with: @tracker.time_of_eat_back_and_forth
    fill_in "Type", with: @tracker.type
    click_on "Create Tracker"

    assert_text "Tracker was successfully created"
    click_on "Back"
  end

  test "should update Tracker" do
    visit tracker_url(@tracker)
    click_on "Edit this tracker", match: :first

    fill_in "Amount", with: @tracker.amount
    fill_in "Brand", with: @tracker.brand
    fill_in "Date", with: @tracker.date
    fill_in "Description", with: @tracker.description
    fill_in "Favorite score", with: @tracker.favorite_score
    fill_in "Feeding time", with: @tracker.feeding_time.to_s
    fill_in "Left amount", with: @tracker.left_amount
    fill_in "Pet", with: @tracker.pet_id
    fill_in "Time of eat back and forth", with: @tracker.time_of_eat_back_and_forth
    fill_in "Type", with: @tracker.type
    click_on "Update Tracker"

    assert_text "Tracker was successfully updated"
    click_on "Back"
  end

  test "should destroy Tracker" do
    visit tracker_url(@tracker)
    click_on "Destroy this tracker", match: :first

    assert_text "Tracker was successfully destroyed"
  end
end
