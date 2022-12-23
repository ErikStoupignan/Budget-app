require 'test_helper'

class GroupMovementsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @group_movement = group_movements(:one)
  end

  test 'should get index' do
    get group_movements_url
    assert_response :success
  end

  test 'should get new' do
    get new_group_movement_url
    assert_response :success
  end

  test 'should create group_movement' do
    assert_difference('GroupMovement.count') do
      post group_movements_url, params: { group_movement: { group_id: @group_movement.group_id, movement_id: @group_movement.movement_id } }
    end

    assert_redirected_to group_movement_url(GroupMovement.last)
  end

  test 'should show group_movement' do
    get group_movement_url(@group_movement)
    assert_response :success
  end

  test 'should get edit' do
    get edit_group_movement_url(@group_movement)
    assert_response :success
  end

  test 'should update group_movement' do
    patch group_movement_url(@group_movement),
          params: { group_movement: { group_id: @group_movement.group_id, movement_id: @group_movement.movement_id } }
    assert_redirected_to group_movement_url(@group_movement)
  end

  test 'should destroy group_movement' do
    assert_difference('GroupMovement.count', -1) do
      delete group_movement_url(@group_movement)
    end

    assert_redirected_to group_movements_url
  end
end
