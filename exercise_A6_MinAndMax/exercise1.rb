#!/usr/bin/env ruby

# Write a program which accepts numbers as arguments and which determines the lowest
# and highest number.

class MinAndMax
  def initialize
    prompt_user_for_input
  end

  def calculate_min_and_max(numbers)
    min = get_min(numbers)
    max = get_max(numbers)

    print_results(numbers.count, min, max)
  end

  def get_min(numbers)
    min = nil

    numbers.each do |num|
      if min == nil
        min = num
      else
        min = num < min ? num : min
      end
    end
    return min
  end

  def get_max(numbers)
    max = nil

    numbers.each do |num|
      if max == nil
        max = num
      else
        max = num > max ? num : max
      end
    end
    return max
  end
  
  def print_results(numbers, min, max)
    puts "Read #{numbers} numbers"
    puts "Min value: #{min}"
    puts "Max value: #{max}"
  end

  def prompt_user_for_input
    puts "Enter a series of numbers, each separated by a space. I will tell you the hightest and lowest number: "
    numbers = gets.chomp.split(' ').map { |num| num.to_i }
    calculate_min_and_max(numbers)
  end
end

MinAndMax.new
