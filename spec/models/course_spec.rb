require 'rails_helper'

RSpec.describe Course, type: :model do
  it "is valid with valid attributes" do
    author = create :author
    expect(Course.new(name: "Deathstar", description: "How to blow one up...", author_id: author.id)).to be_valid
  end

  it "is invalid when the name is missing" do
    author = create :author
    expect(Course.new(description: "How to blow one up...", author_id: author.id)).to_not be_valid
  end
end
