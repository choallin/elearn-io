require 'rails_helper'

RSpec.describe "Courses", type: :request do
  describe "GET /courses" do
    it "works!" do
      create :course
      get courses_path
      expect(response).to have_http_status(200)
      expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
    end
  end

  describe "GET relationships" do
    before do
      @course = create :course
    end

    it "loads the author for a course" do
      get courses_path + "/?include=author"
      expect(response).to have_http_status(200)
      expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
      expect(JSON.parse(response.body, symbolize_names: true)[:included].length).to be 1
    end
  end

  describe "POST create a course with author" do
    before do
      @author = create :author
    end
    it "creates a course" do
      course_data = {
        "data": {
          "type": "courses",
          "attributes": {
            "name": "Ember Hamster",
            "description": "Learn about Ember"
          },
          "relationships": {
            "author": {
              "data": { "type": "authors", "id": @author.id }
            }
          }
        }
      }
      post courses_path(params: course_data), headers: {"Content-Type" => "application/vnd.api+json"}
      expect {
        post courses_path(params: course_data), headers: {"Content-Type" => "application/vnd.api+json"}
      }.to change(Course, :count).by(1)
    end
  end
end
