require "test_helper"

class StudentsControllerTest < ActionDispatch::IntegrationTest
  test "create" do
    assert_difference "Student.count", 1 do
      post "/students.json", params: {
        first_name: "testy",
        last_name: "mctest",
        email: "testymctest@test.com",
        phone_number: 5555555,
        short_bio: "This is a very short bio isn't it?",
        linkedin_url: "testymctestelinkedin.com",
        twitter_handle: "@testymctest",
        website_url: "testymctest.com",
        online_resume_url: "testymctestsresume.com",
        github_url: "testymctestsgithub.com",
        photo: "photo"
      }
      assert_response 200
    end
  end

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
    assert_equal ["id", "first_name", "last_name", "email", "phone_number", "short_bio", "linkedin_url", "twitter_handle", "website_url", "online_resume_url", "github_url", "photo", "created_at", "updated_at"], data.keys
  end

  test "update" do
    student = Student.first
    patch "/students/#{student.id}.json", params: {
      first_name: "Updated first_name",
      last_name: "Updated last_name",
      email: "Updated email",
      phone_number: 5235555,
      short_bio: "Updated short_bio",
      linkedin_url: "Updated linkedin_url",
      twitter_handle: "Updated twitter_handle",
      website_url: "Updated website_url",
      online_resume_url: "Updated online_resume_url",
      github_url: "Updated github_url",
      photo: "Updated photo" 
    }
    assert_response 200

    data = JSON.parse(response.body)
    assert_equal "Updated first_name", data["first_name"]
    assert_equal "Updated last_name", data["last_name"]
    assert_equal "Updated email", data["email"]
    assert_equal 5235555, data["phone_number"]
    assert_equal "Updated short_bio", data["short_bio"]
    assert_equal "Updated linkedin_url", data["linkedin_url"]
    assert_equal "Updated twitter_handle", data["twitter_handle"]
    assert_equal "Updated website_url", data["website_url"]
    assert_equal "Updated online_resume_url", data["online_resume_url"]
    assert_equal "Updated github_url", data["github_url"]
    assert_equal "Updated photo",  data["photo"]
  end

  test "destroy" do
    assert_difference "Student.count", -1 do
      delete "/students/#{Student.first.id}.json"
      assert_response 200
    end
  end
end
