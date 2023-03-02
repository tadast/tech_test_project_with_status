require "test_helper"

class ProjectsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers

  setup do
    @project = projects(:sample)
    @author = users(:author)
  end

  test "prevent logged out users to see projects" do
    get projects_url

    assert_redirected_to new_user_session_path
  end

  test "should get index" do
    sign_in @author
    get projects_url
    assert_response :success
  end

  test "should get new" do
    sign_in @author
    get new_project_url
    assert_response :success
  end

  test "should create project" do
    sign_in @author
    assert_difference("Project.count") do
      post projects_url, params: { project: { title: @project.title } }
    end

    assert_redirected_to project_url(Project.last)
  end

  test "should persist the project's author" do
    sign_in @author
    assert_difference("@author.projects.count", 1) do
      post projects_url, params: { project: { title: @project.title } }
    end
  end

  test "should show project" do
    sign_in @author
    get project_url(@project)
    assert_response :success
  end

  test "should get edit" do
    sign_in @author
    get edit_project_url(@project)
    assert_response :success
  end

  test "should update project" do
    sign_in @author
    patch project_url(@project), params: { project: { title: @project.title, user_id: @project.user_id } }
    assert_redirected_to project_url(@project)
  end

  test "should destroy project" do
    sign_in @author
    assert_difference("Project.count", -1) do
      delete project_url(@project)
    end

    assert_redirected_to projects_url
  end
end
