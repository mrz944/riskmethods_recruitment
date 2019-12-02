require 'rails_helper'

RSpec.describe Location, type: :model do
  subject { described_class.new }

  it "is valid with valid name and geometry" do
    factory = RGeo::Cartesian.preferred_factory
    point = factory.point(0, 0)
    subject.geom = point
    subject.name = 'Name'
    expect(subject).to be_valid
  end

  it "is not valid without a geometry" do
    subject.name = 'Name'
    expect(subject).to_not be_valid
  end

  it "is not valid without a name" do
    factory = RGeo::Cartesian.preferred_factory
    point = factory.point(0, 0)
    subject.geom = point
    expect(subject).to_not be_valid
  end
end
