require 'test_helper'

class PlaguesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @plague = plagues(:one)
  end

  test "should get index" do
    get plagues_url
    assert_response :success
  end

  test "should get new" do
    get new_plague_url
    assert_response :success
  end

  test "should create plague" do
    assert_difference('Plague.count') do
      post plagues_url, params: { plague: { desc: @plague.desc, name: @plague.name } }
    end

    assert_redirected_to plague_url(Plague.last)
  end

  test "should show plague" do
    get plague_url(@plague)
    assert_response :success
  end

  test "should get edit" do
    get edit_plague_url(@plague)
    assert_response :success
  end

  test "should update plague" do
    patch plague_url(@plague), params: { plague: { desc: @plague.desc, name: @plague.name } }
    assert_redirected_to plague_url(@plague)
  end

  test "should destroy plague" do
    assert_difference('Plague.count', -1) do
      delete plague_url(@plague)
    end

    assert_redirected_to plagues_url
  end
end
