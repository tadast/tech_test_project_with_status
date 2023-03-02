require "application_system_test_case"

class ProjectsTest < ApplicationSystemTestCase
  include Devise::Test::IntegrationHelpers

  setup do
    @project = projects(:sample)
    @author = users(:author)
    sign_in @author
  end


  test "adds and displays a comment on a Project" do
    visit project_url(@project)

    fill_in "Leave a comment", with: "Looks good to me"
    click_on "Post a comment"

    assert_text "Your comment has been posted"
    assert_text "Looks good to me"
  end

  test "records and displays a status change" do
    visit project_url(@project)

    click_on "Edit this project"
    select "Open", from: "Status"
    click_on "Update Project"

    assert_text "#{@author.email} changed status from Draft to Open."
  end
end
