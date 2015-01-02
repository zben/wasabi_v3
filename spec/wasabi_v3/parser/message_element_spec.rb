require 'spec_helper'

describe WasabiV3::Parser do
  context 'with: savon562.wsdl' do
    subject do
      parser = WasabiV3::Parser.new Nokogiri::XML(xml)
      parser.parse
      parser
    end

    let(:xml) { fixture(:savon562).read }

    it 'parses the operations' do
      subject.operations[:write_case_eform_data][:input].should == 'writeCaseEformData'
    end
  end
end
