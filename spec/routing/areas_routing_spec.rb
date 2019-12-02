require "rails_helper"

RSpec.describe AreasController, type: :routing do
  describe "routing" do
    it "routes to #index" do
      expect(:get => "/areas").to route_to("areas#index")
    end
  end
end
