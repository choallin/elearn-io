require 'rails_helper'

RSpec.describe "Talents", type: :request do
  describe "GET /talents" do
    it "works!" do
      create :talent
      get talents_path
      expect(response).to have_http_status(200)
      expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
    end
  end

  describe "GET relationships" do
    before do
      @course = create :course
    end

    it "loads the courses for a talent" do
      talent = create :talent
      @course.talents << talent
      @course.save
      get talent_relationships_courses_path(talent.id)
      expect(response).to have_http_status(200)
      expect(response.content_type).to match(a_string_including("application/vnd.api+json"))
      expect(JSON.parse(response.body, symbolize_names: true)[:data].length).to be 1
    end
  end
end
