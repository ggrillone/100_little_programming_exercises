#!/usr/bin/env ruby

# Write a program that takes a single argument and returns the
# factorial. In this program, make it interactive so the argument
# can be input by the user. Also store a table of previously used
# value to improve performance.
class InteractiveFactorial
  attr_accessor :hash_map_of_previous_values, :number_argument

  def initialize
    @hash_map_of_previous_values = []
    prompt_user_for_input
  end

  def check_hash_map(key)
    arr_of_keys = @hash_map_of_previous_values.map { |val| val.keys }.flatten

    return arr_of_keys.include?("#{key}") ? get_value_for_previous_value_key("#{key}")  : false
  end

  def get_value_for_previous_value_key(key)
    @hash_map_of_previous_values.each do |val|
      return val.values if val.values == key
    end
  end

  def push_new_value(key,value)
    h = Hash.new
    h["#{key}"] = value
  end

  def analyze_user_input
    factorial_in_table = check_hash_map(@number_argument)
    if factorial_in_table == false
      return calculate_factorial
    else
      return factorial_in_table
    end
  end

  def calculate_factorial
    num2 = 1
    (1..@number_argument).to_a.each do |num|
      num2 = num2 * num
    end
    push_new_value(@number_argument, num2)
    return num2
  end

  def prompt_user_for_input
    print "I will calcualte a factorial for you, what number would you like to use? "
    @number_argument = gets.chomp.to_i
    print "Here are the results:"
    puts "#{@number_argument}! = #{analyze_user_input}"
    puts "Let's do it again!"
    prompt_user_for_input
  end
end

InteractiveFactorial.new
