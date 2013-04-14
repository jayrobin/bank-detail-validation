class Swift
  def self.valid?(swift)
    !!(swift.gsub(" ", "").upcase =~ /\A[A-Z]{6}[A-Z0-9]{2}([A-Z0-9]{3})?\z/)
  end
end