require "application_system_test_case"

class TestsTest < ApplicationSystemTestCase
  setup do
    @test = tests(:one)
  end

  test "visiting the index" do
    visit tests_url
    assert_selector "h1", text: "Tests"
  end

  test "should create test" do
    visit tests_url
    click_on "New test"

    fill_in "Course module", with: @test.course_module_id
    fill_in "Earned score", with: @test.earned_score
    check "Is threshold" if @test.is_threshold
    fill_in "Max score", with: @test.max_score
    fill_in "Name", with: @test.name
    fill_in "Weight", with: @test.weight
    click_on "Create Test"

    assert_text "Test was successfully created"
    click_on "Back"
  end

  test "should update Test" do
    visit test_url(@test)
    click_on "Edit this test", match: :first

    fill_in "Course module", with: @test.course_module_id
    fill_in "Earned score", with: @test.earned_score
    check "Is threshold" if @test.is_threshold
    fill_in "Max score", with: @test.max_score
    fill_in "Name", with: @test.name
    fill_in "Weight", with: @test.weight
    click_on "Update Test"

    assert_text "Test was successfully updated"
    click_on "Back"
  end

  test "should destroy Test" do
    visit test_url(@test)
    click_on "Destroy this test", match: :first

    assert_text "Test was successfully destroyed"
  end
end
