require 'rails_helper'

RSpec.describe Author, type: :model do
  it "is valid with valid attributes" do
    expect(Author.new(firstname: "Luke", lastname: "Skywalker")).to be_valid
  end
  it "is invalid with missing firstname" do
    expect(Author.new(lastname: "Skywalker")).to_not be_valid
  end
  it "is invalid with missing lastname" do
    expect(Author.new(firstname: "Luke")).to_not be_valid
  end

  it "redistributes the author of a course when an author is deleted" do
    course1 = create :course
    course2 = create :course
    Author.find(course1.author_id).destroy
    course1.reload
    expect(course1.author_id).to eql(course2.author_id)
  end

end
