require "application_system_test_case"

class CourseModulesTest < ApplicationSystemTestCase
  setup do
    @course_module = course_modules(:one)
  end

  test "visiting the index" do
    visit course_modules_url
    assert_selector "h1", text: "Course modules"
  end

  test "should create course module" do
    visit course_modules_url
    click_on "New course module"

    fill_in "Credits", with: @course_module.credits
    fill_in "Module name", with: @course_module.module_name
    fill_in "Year", with: @course_module.year_id
    click_on "Create Course module"

    assert_text "Course module was successfully created"
    click_on "Back"
  end

  test "should update Course module" do
    visit course_module_url(@course_module)
    click_on "Edit this course module", match: :first

    fill_in "Credits", with: @course_module.credits
    fill_in "Module name", with: @course_module.module_name
    fill_in "Year", with: @course_module.year_id
    click_on "Update Course module"

    assert_text "Course module was successfully updated"
    click_on "Back"
  end

  test "should destroy Course module" do
    visit course_module_url(@course_module)
    click_on "Destroy this course module", match: :first

    assert_text "Course module was successfully destroyed"
  end
end
