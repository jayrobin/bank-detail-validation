class ABA
  def self.valid?(aba)
    is_correct_length?(aba) && validate_check_digits(aba)
  end

  def self.is_correct_length?(aba)
    aba.length == 9
  end

  def self.validate_check_digits(aba)
    aba = aba.split(//).map { |n| n.to_i }
    aba[8] == (
                7 * (aba[0] + aba[3] + aba[6]) +
                3 * (aba[1] + aba[4] + aba[7]) +
                9 * (aba[2] + aba[5])
              ) % 10
  end
end

# valid ABA
puts ABA.valid?("111000025").to_s

# remove character
puts ABA.valid?("1110005").to_s

# replace character
puts ABA.valid?("111003025").to_s

# swap character
puts ABA.valid?("110100025").to_s