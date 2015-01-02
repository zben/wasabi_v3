require "wasabi_v3/version"
require "wasabi_v3/document"
require "wasabi_v3/resolver"

module WasabiV3

  # Expects a WSDL document and returns a <tt>WasabiV3::Document</tt>.
  def self.document(document)
    Document.new(document)
  end

end
