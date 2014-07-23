#!/usr/bin/env ruby

# Write a program which takes a single argument, computes the factorial and prints the
# value on the screen.

# I. Iteratively
def do_factorial_iteratively(num)
  num2 = 1  

  (1..num).to_a.each do |num_in_range|
    num2 = num2 * num_in_range
  end

  return "Iteratively: #{num}! = #{num2}"
end

# II. Recursively
class FactorialRecursive
  attr_accessor :recursive_num

  def initialize
    @recursive_num = 1
  end
  
  def do_factorial_recursively(num)
    if num < 1
      return "Recursively: #{@recursive_num}"
    else
      @recursive_num = @recursive_num * (num)
      do_factorial_recursively(num - 1)
    end
  end
end


puts do_factorial_iteratively(5)
factorial_recursive = FactorialRecursive.new
puts factorial_recursive.do_factorial_recursively(5)
