require 'date'

module Validation
  def self.valid_name?(string)
    return false if string.nil? || string.empty?
    return false if string.length > 40
    return false unless string.match?(/\A[A-Za-z\-]+\z/)
    true
  end

  def self.valid_inn?(string)
    return false if string.nil? || string.empty?
    return false unless string.match?(/\A[A-Z]{2}\d{10}\z/)
    true
  end

  def self.after_date?(date)
    return false if date.nil?
    date <= Date.today
  end
end



name = "Maria-Anna"
puts Validation.valid_name?(name) # Output: true

inn = "AZ1234543456"
puts Validation.valid_inn?(inn) # Output: true

date = Date.parse("2003-10-05")
puts Validation.after_date?(date) # Output: true

