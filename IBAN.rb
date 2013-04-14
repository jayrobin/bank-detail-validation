class IBAN
  def self.valid?(iban)
    # remove any spaces and set to upcase
    iban.gsub!(" ", "").upcase!

    # move the first four chars to the end of the string
    iban = iban[4, iban.length - 1] + iban[0, 4]

    # replace alpha chars with their respective digits, starting at A=10
    iban = iban.chars.map { |char| char.match(/[A-Z]/) ? char.ord - 55 : char }

    # compose integer and return true if mod 97 remainder is 1
    iban.join.to_i % 97 == 1
  end
end