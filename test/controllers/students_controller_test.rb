require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "index" do
    get "/students.json"
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal Student.count, data.length
end

test "show" do
  get "/students/#{Student.first.id}.json"
  assert_response 200

    data = JSON.parse(response.body)
    assert_equal ["first_name", "last_name", "email", "phone_number", "short_bio", "linkedin_url", "twitter_handle", "website_url", "online_resume_url", "github_url", "photo"], data.keys
  end

end