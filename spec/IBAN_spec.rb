require_relative '../IBAN'

describe IBAN do
  describe "get_length_for_country" do
    it "should return the IBAN length for a given ISO code" do
      IBAN.get_length_for_country("GB").should == 22
    end

    it "should raise an exception for a non-existant ISO code" do
      expect { IBAN.get_length_for_country("XX") }.to raise_error
    end
  end

  describe "length_check" do
    it "should check the given IBAN's length against the required length for the country" do
      length = 10
      iban = "iban"

      iban.stub!(:length).and_return length
      IBAN.stub!(:get_length_for_country).and_return length

      IBAN.length_check(iban).should == true
    end
  end

  describe "mod_97_Check" do
    it "should return true for a valid IBAN" do
      IBAN.mod_97_Check("GB82WEST12345698765432").should == true
    end

    it "should return false for an invalid IBAN where a character has been removed" do
      IBAN.mod_97_Check("B82WEST12345698765432").should == false
    end

    it "should return false for an invalid IBAN where a character has been replaced" do
      IBAN.mod_97_Check("XB82WEST12345698765432").should == false
    end

    it "should return false for an invalid IBAN where two characters have been swapped" do
      IBAN.mod_97_Check("BG82WEST12345698765432").should == false
    end
  end

  describe "valid?" do
    it "should return true for a valid IBAN" do
      IBAN.valid?("GB82 WEST 1234 5698 7654 32").should == true
    end

    it "should return false for an invalid IBAN" do
      IBAN.valid?("GB82 Wfdsf1234 5www98 7 32").should == false
    end
  end
end