require "spec_helper"

describe WasabiV3::Document do

  subject { WasabiV3::Document.new fixture(:authentication).read }

  it "accepts a URL" do
    expect(HTTPI).to receive(:get) { HTTPI::Response.new(200, {}, "wsdl") }

    document = WasabiV3::Document.new("http://example.com?wsdl")
    expect(document.xml).to eq("wsdl")
  end

  it "accepts a path" do
    document = WasabiV3::Document.new fixture(:authentication).path
    expect(document.xml).to eq(fixture(:authentication).read)
  end

  it "accepts raw XML" do
    document = WasabiV3::Document.new fixture(:authentication).read
    expect(document.xml).to eq(fixture(:authentication).read)
  end

  describe ".validate_element_form_default!" do
    [:unqualified, :qualified].each do |value|
      it "does not raise for :#{value}" do
        expect { WasabiV3::Document.validate_element_form_default!(value) }.to_not raise_error
      end
    end

    it "raises if given an invalid value" do
      error_msg = "Invalid value for elementFormDefault: invalid\n" +
                  "Must be one of: [:unqualified, :qualified]"

      expect { WasabiV3::Document.validate_element_form_default!(:invalid) }.
        to raise_error(ArgumentError, error_msg)
    end
  end

  describe "#element_form_default" do
    it "defaults to :unqualified" do
      expect(subject.element_form_default).to eq(:unqualified)
    end

    [:unqualified, :qualified].each do |value|
      it "accepts :#{value}" do
        subject.element_form_default = value
        expect(subject.element_form_default).to eq(value)
      end
    end

    it "raises if set to an invalid value" do
      expect { subject.element_form_default = :invalid }.
        to raise_error(ArgumentError, /Invalid value for elementFormDefault/)
    end
  end

end
