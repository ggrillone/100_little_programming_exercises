#!/usr/bin/env ruby

# Write a calculator which evaluates expressions with decimal numbers and the operators
# +,-,*,/ and prints the result on the screen.

class Calculator
  def initialize
    prompt_user_for_input
  end

  def calculate_expression(input)
    puts eval(input)
  end

  def throw_error(error_msg)
    puts "Hey doofus you fucked up! #{error_msg}"
  end

  def prompt_user_for_input
    puts "Enter any expressions using + (addition), - (subtraction), * (multiplication), and/or / (division)"
    puts "Each expression should be separated by a space, i.e. 1 + 2 * 3"
    input = gets.chomp
    calculate_expression(input)
  end
end

Calculator.new
