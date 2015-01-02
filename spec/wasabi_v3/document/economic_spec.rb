require 'spec_helper'

describe WasabiV3::Document do
  context 'with: economic.wsdl' do

    subject { WasabiV3::Document.new fixture(:economic).read }

    it 'has an ok parse-time for huge wsdl files' do
      expect(subject.operations.count).to eq(1511)
    end

  end
end
