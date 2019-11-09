require 'test_helper'

class AlumnusControllerTest < ActionDispatch::IntegrationTest
  setup do
    @alumnu = alumnus(:one)
  end

  test "should get index" do
    get alumnus_url, as: :json
    assert_response :success
  end

  test "should create alumnu" do
    assert_difference('Alumnu.count') do
      post alumnus_url, params: { alumnu: { college: @alumnu.college, currentlyLiving: @alumnu.currentlyLiving, hobbies: @alumnu.hobbies, name: @alumnu.name, profession: @alumnu.profession, sportPlayedInHighSchool: @alumnu.sportPlayedInHighSchool, yearGraduated: @alumnu.yearGraduated } }, as: :json
    end

    assert_response 201
  end

  test "should show alumnu" do
    get alumnu_url(@alumnu), as: :json
    assert_response :success
  end

  test "should update alumnu" do
    patch alumnu_url(@alumnu), params: { alumnu: { college: @alumnu.college, currentlyLiving: @alumnu.currentlyLiving, hobbies: @alumnu.hobbies, name: @alumnu.name, profession: @alumnu.profession, sportPlayedInHighSchool: @alumnu.sportPlayedInHighSchool, yearGraduated: @alumnu.yearGraduated } }, as: :json
    assert_response 200
  end

  test "should destroy alumnu" do
    assert_difference('Alumnu.count', -1) do
      delete alumnu_url(@alumnu), as: :json
    end

    assert_response 204
  end
end
