require "application_system_test_case"

class CommentsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @project = projects(:sample)
    @author = users(:author)
    sign_in @author
  end


  test "adds a comment to a Project" do
    visit project_url(@project)

    fill_in "New comment", with: "Looks good to me"
    click_on "Post a comment"

    assert_text "Your comment has been posted"
    # assert_text "Looks good to me"
  end
end
