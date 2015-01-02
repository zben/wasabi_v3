require "spec_helper"

describe WasabiV3::Document do
  context "with: soap12.wsdl" do

    subject { WasabiV3::Document.new fixture(:soap12).read }

    describe '#endpoint' do
      subject { super().endpoint }
      it { should == URI("http://blogsite.example.com/endpoint12") }
    end

  end
end
