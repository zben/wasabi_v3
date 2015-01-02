require "spec_helper"

describe WasabiV3 do

  describe ".document" do
    it "should return a new WasabiV3::Document" do
      document = WasabiV3.document fixture(:authentication).read
      expect(document).to be_a(WasabiV3::Document)
    end
  end

end
