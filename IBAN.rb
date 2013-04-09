# performs a mod-97 check on an IBAN according to ISO 7064 specification
def is_valid?(iban)
  # remove any spaces and set to upcase
  iban.gsub!(" ", "").upcase!

  # move the first four chars to the end of the string
  iban = iban[4, iban.length - 1] + iban[0, 4]

  # replace alpha chars with their respective digits, starting at A=10
  iban = iban.chars.map do |char|
  	if char.match(/[A-Z]/)
  		char.ord - 55
  	else
  		char
  	end
  end

  # compose integer and return true if mod 97 remainder is 1
  puts iban.join.to_i % 97 == 1
end

puts is_valid? "GB82 WEST 1234 5698 7654 32"