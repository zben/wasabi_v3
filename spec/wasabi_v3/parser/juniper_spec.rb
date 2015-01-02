require "spec_helper"

describe WasabiV3::Parser do
  context 'with: juniper.wsdl' do

    subject do
      parser = WasabiV3::Parser.new Nokogiri::XML(xml)
      parser.parse
      parser
    end

    let(:xml) { fixture(:juniper).read }

    it 'does not blow up when an extension base element is defined in an import' do
      request = subject.operations[:get_system_info_request]

      expect(request[:input]).to eq('GetSystemInfoRequest')
      expect(request[:action]).to eq('urn:#GetSystemInfoRequest')
      expect(request[:namespace_identifier]).to eq('impl')
    end

  end
end
