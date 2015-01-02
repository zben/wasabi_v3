require 'spec_helper'

describe WasabiV3::Parser do
  context 'with: tradetracker.wsdl' do
    subject do
      parser = WasabiV3::Parser.new Nokogiri::XML(xml)
      parser.parse
      parser
    end

    let(:xml) { fixture(:tradetracker).read }

    it 'parses the operations' do
      expect(subject.operations[:get_feeds][:input]).to eq('getFeeds')
    end
  end
end
