require "spec_helper"

describe WasabiV3::Parser do
  context "with: geotrust.wsdl" do

    subject do
      parser = WasabiV3::Parser.new Nokogiri::XML(xml)
      parser.parse
      parser
    end

    let(:xml) { fixture(:geotrust).read }

    it "returns the #service_name attribute" do
      expect(subject.service_name).to eq("queryDefinitions")
    end

  end
end
