#!/usr/bin/env ruby

# Write a program which reads a number of strings from standard
# input and prints them in reverse order on the screen.
# The input sequence is terminated with the string END.

class ReverseTheInput
  def initialize
    prompt_for_user_input
  end

  def reverse_string(input)
    (1..input.count).to_a.each do |v|
      puts input.pop
    end
    puts 'END'
  end

  def prompt_for_user_input
    puts "Enter a series of strings, each separated by a space: "
    input = gets.chomp.split(' ')
    reverse_string(input)
  end
end

ReverseTheInput.new
