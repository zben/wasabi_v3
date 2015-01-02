require "spec_helper"

describe WasabiV3::Resolver do

  describe "#resolve" do
    it "resolves remote documents" do
      expect(HTTPI2).to receive(:get) { HTTPI2::Response.new(200, {}, "wsdl") }
      xml = WasabiV3::Resolver.new("http://example.com?wsdl").resolve
      expect(xml).to eq("wsdl")
    end

    it "resolves remote documents with custom adapter" do
      prev_logging = HTTPI2.instance_variable_get(:@log)
      HTTPI2.log = false # Don't pollute rspec output by request logging
      xml = WasabiV3::Resolver.new("http://example.com?wsdl", nil, :fake_adapter_for_test).resolve
      expect(xml).to eq("wsdl_by_adapter")
      expect(FakeAdapterForTest.class_variable_get(:@@requests).size).to eq(1)
      expect(FakeAdapterForTest.class_variable_get(:@@requests).first.url).to eq(URI.parse("http://example.com?wsdl"))
      expect(FakeAdapterForTest.class_variable_get(:@@methods)).to eq([:get])
      HTTPI2.log = prev_logging
    end

    it "resolves local documents" do
      xml = WasabiV3::Resolver.new(fixture(:authentication).path).resolve
      expect(xml).to eq(fixture(:authentication).read)
    end

    it "simply returns raw XML" do
      xml = WasabiV3::Resolver.new("<xml/>").resolve
      expect(xml).to eq("<xml/>")
    end

    it "raises HTTPError when #load_from_remote gets a response error" do
      code = 404
      headers = {
        "content-type" => "text/html"
      }
      body = "<html><head><title>404 Not Found</title></head><body>Oops!</body></html>"
      failed_response = HTTPI2::Response.new(code, headers, body)
      HTTPI2.stub(:get => failed_response)
      expect do
        WasabiV3::Resolver.new("http://example.com?wsdl").resolve
      end.to raise_error { |ex|
        expect(ex).to be_a(WasabiV3::Resolver::HTTPError)
        expect(ex.message).to eq("Error: #{code}")
        expect(ex.response).to eq(failed_response)
      }
    end
  end

end
