require 'yaml'

class IBAN
  def self.valid?(iban)
    # remove any spaces and set to upcase
    iban.gsub!(" ", "").upcase!

    length_check(iban) &&
    mod_97_Check(iban)
  end

  def self.length_check(iban)
    # obtain the country ISO code
    country_code = iban[0, 2]

    # get the iban length for the given country
    length = get_length_for_country(country_code)

    iban.length == length
  end

  def self.get_length_for_country(country_code)
    rules = YAML.load(File.read(File.dirname(__FILE__) + "/iban.yml"))

    raise "Country code not found" unless rules[country_code]

    rules[country_code]["length"]
  end

  def self.mod_97_Check(iban)
    # move the first four chars to the end of the string
    checked_iban = iban[4, iban.length - 1] + iban[0, 4]

    # replace alpha chars with their respective digits, starting at A=10
    checked_iban = checked_iban.chars.map { |char| char.match(/[A-Z]/) ? char.ord - 55 : char }

    # compose integer and return true if mod 97 remainder is 1
    checked_iban.join.to_i % 97 == 1
  end
end