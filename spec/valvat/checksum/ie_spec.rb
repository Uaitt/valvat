require 'spec_helper'

describe Valvat::Checksum::IE do
  %w(IE8473625E IE0123459N IE9B12345N).each do |valid_vat|
    it "returns true on valid vat #{valid_vat}" do
      expect(Valvat::Checksum.validate(valid_vat)).to eql(true)
    end

    invalid_vat = "#{valid_vat[0..-4]}#{valid_vat[-2]}#{valid_vat[-3]}#{valid_vat[-1]}"

    it "returns false on invalid vat #{invalid_vat}" do
      expect(Valvat::Checksum.validate(invalid_vat)).to eql(false)
    end
  end
end