#!/usr/bin/env ruby

# Write a program which takes a decimal value and 2 currency codes, and then computes
# the value of the other currency given a fixed conversion rate. If one of the currency
# codes is not known the program should print an error. When run without any arguments
# the program should print some usage information including a list of all known currency codes
# for which it has conversion rates

class CurrencyConverter
  attr_accessor :available_currency_codes, :conversion_rates

  def initialize
    @available_currency_codes = ['EUR', 'USD']
    @conversion_rates = [{ :EUR => [{ :USD => 1.35 }] }, { :USD => [{ :EUR => 0.74 }] }]
    print_usage_info
  end

  def print_usage_info
    puts "*** Usage Information ***"
    puts "Enter Currency you have your money in, the amount you have and the currency you want to convert the amount to"
    puts "Example (each value separated by a space): EUR 1,000.00 USD"
    puts "Currently supported currencies are:"
    @available_currency_codes.each do |ccy|
      puts ccy
    end
    puts ""
    prompt_user_for_input
  end

  def print_error
    puts "Error: Unsupported Currency used."
    print_usage_info
  end

  def get_rate(ccy1, ccy2)
    conversion_rate = nil
    @conversion_rates.each do |ccy|
      if ccy.keys.first == ccy1.upcase.to_sym
        ccy.values.each do |rates|
          rates.each do |rate|
            if rate.keys.first == ccy2.upcase.to_sym
              conversion_rate = rate[ccy2.upcase.to_sym]
            end
          end
        end
      end
    end
   
    return conversion_rate
  end

  def do_conversion(ccy1, ccy2, amount)
    conversion = (amount.to_f * get_rate(ccy1, ccy2).to_f).to_f
    puts "#{amount} #{ccy1} converted to #{ccy2} = #{conversion}"
  end

  def check_for_currency_code(ccy1, ccy2, amount)
    if @available_currency_codes.include?(ccy1.upcase) && @available_currency_codes.include?(ccy2.upcase)
      return do_conversion(ccy1, ccy2, amount)
    else
      return print_error
    end
  end

  def prompt_user_for_input
    puts "Please enter paramaters for currency conversion: "
    input = gets.chomp.split(' ')
    if input.count == 3
      ccy_dealt = input.first
      amount = input[1].gsub(',','').to_f
      ccy_term = input[2]
      check_for_currency_code(ccy_dealt, ccy_term, amount) 
    else
      print_usage_info
    end
  end
end

CurrencyConverter.new
