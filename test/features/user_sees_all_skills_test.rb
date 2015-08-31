require_relative '../test_helper'

class UserSeesAllSkillsTest < FeatureTest


end

class UserCreatesASkillTest < FeatureTest
  def test_user_creates_a_task
      visit '/'
      click_link "New Skill"
      assert_equal "/skills/new", current_path
      fill_in "skill[name]", with: "Go Home"
      fill_in "skill[status]", with: "It's been a loooooong day"
      click_button "Submit"

      assert_equal "/skills", current_path
      assert page.has_content?("Go Home")
    end
end

class UserEditsASkill < FeatureTest

end

class UserDeleteASkill < FeatureTest

end



# class UserSeesAllTasksTest < FeatureTest
#   def test_all_tasks_are_displayed
#     visit '/'
#     assert page.has_content?("Welcome to the Task Manager")
#   end
#
#   def test_header_has_content
#     visit '/'
#     # save_and_open_page   -  this is kinda like pry
#     within('#test') do
#       assert page.has_content?("Welcome to the Task Manager")
#     end
#   end
#
#   def test_user_creates_a_task
#     visit '/'
#     click_link "New Task"
#     fill_in "task[title]", with: "Go Home"
#     fill_in "task[description]", with: "It's been a loooooong day"
#     click_button "Submit"
#
#     assert_equal "/tasks", current_path
#     assert page.has_content?("Go Home")
#   end
#
# end
#
# class UserCreatesATasksTest < FeatureTest
#   def test_user_creates_a_task
#     visit '/'
#     click_link "New Task"
#     fill_in "task[title]", with: "Go Home"
#     fill_in "task[description]", with: "It's been a loooooong day"
#     click_button "Submit"
#
#     assert_equal "/tasks", current_path
#     assert page.has_content?("Go Home")
#   end
# end
#
# class UserEditsATask < FeatureTest
#   def test_user_can_edit_a_task
#     visit '/'
#     click_link "New Task"
#     fill_in "task[title]", with: "Go Home"
#     fill_in "task[description]", with: "It's been a loooooong day"
#     click_button "Submit"
#
#     id = TaskManager.send(:dataset).all.last[:id] # <-- HAAAAACK!!!
#     visit "/tasks/#{id}/edit"
#     fill_in "task[title]", with: "This is a task"
#     fill_in "task[description]", with: "I like tasks"
#     assert page.has_content?("I like tasks")
#     click_button "Submit"
#
#     assert_equal "/tasks/#{id}", current_path
#     assert page.has_content?("I like tasks")
#   end
# end
#
# class UserDeleteATask < FeatureTest
#   def test_user_can_delete_a_task
#     visit '/'
#     click_link "New Task"
#     fill_in "task[title]", with: "Go Home"
#     fill_in "task[description]", with: "It's been a loooooong day"
#     click_button "Submit"
#
#     visit '/tasks'
#     click_button "Delete"
#
#     refute page.has_content?("Go Home")
#     refute page.has_content?("Stuff")
#   end
# end
# assert '/', current_path


# write tests for creating, editing, deleting a task
# create new files maybe, UserCreatesATask
