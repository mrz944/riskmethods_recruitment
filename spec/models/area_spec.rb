require 'rails_helper'

RSpec.describe Area, type: :model do
  subject { described_class.new }

  it "is valid with valid geometry" do
    factory = RGeo::Cartesian.preferred_factory
    p00 = factory.point(0, 0)
    p20 = factory.point(2, 0)
    p11 = factory.point(1, 1)
    ring = factory.linear_ring([p00, p11, p20, p00])
    polygon = factory.polygon(ring)
    subject.geom = polygon
    expect(subject).to be_valid
  end

  it "is not valid without a geometry" do
    expect(subject).to_not be_valid
  end
end
