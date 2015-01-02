require "spec_helper"

describe WasabiV3::Document do
  context "with: savon295.wsdl" do

    subject { WasabiV3::Document.new fixture(:savon295).read }

    describe '#operations' do
      subject { super().operations }
      it do
      should include(
        { :sendsms => { :input => "sendsms", :output => "sendsms", :action => "sendsms", :namespace_identifier => "tns" } }
      )
    end
    end

  end
end
