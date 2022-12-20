require "application_system_test_case"

class GroupMovementsTest < ApplicationSystemTestCase
  setup do
    @group_movement = group_movements(:one)
  end

  test "visiting the index" do
    visit group_movements_url
    assert_selector "h1", text: "Group movements"
  end

  test "should create group movement" do
    visit group_movements_url
    click_on "New group movement"

    fill_in "Group", with: @group_movement.group_id
    fill_in "Movement", with: @group_movement.movement_id
    click_on "Create Group movement"

    assert_text "Group movement was successfully created"
    click_on "Back"
  end

  test "should update Group movement" do
    visit group_movement_url(@group_movement)
    click_on "Edit this group movement", match: :first

    fill_in "Group", with: @group_movement.group_id
    fill_in "Movement", with: @group_movement.movement_id
    click_on "Update Group movement"

    assert_text "Group movement was successfully updated"
    click_on "Back"
  end

  test "should destroy Group movement" do
    visit group_movement_url(@group_movement)
    click_on "Destroy this group movement", match: :first

    assert_text "Group movement was successfully destroyed"
  end
end
