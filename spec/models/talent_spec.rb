require 'rails_helper'

RSpec.describe Talent, type: :model do
  it "is valid with valid attributes" do
    expect(Talent.new(firstname: "Luke", lastname: "Skywalker")).to be_valid
  end
  it "is invalid with missing firstname" do
    expect(Talent.new(lastname: "Skywalker")).to_not be_valid
  end
  it "is invalid with missing lastname" do
    expect(Talent.new(firstname: "Luke")).to_not be_valid
  end
end
