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
    assert_equal ["id", "first_name", "last_name", "email", "phone_number", "short_bio", "linkedin_url", "twitter_handle", "website_url", "online_resume", "github_url", "photo", "created_at", "updated_at"], data.keys
  end

end