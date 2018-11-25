require 'test_helper'

class NotesControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get notes_index_url
    assert_response :success
  end

  test "should get show" do
    get notes_show_url
    assert_response :success
  end

  test "should get edit" do
    get notes_edit_url
    assert_response :success
  end

  test "should get new" do
    get notes_new_url
    assert_response :success
  end

end
