#!/usr/bin/env ruby

# Write a program which simulates one or more dice with values from 1 to 6.
# The program takes a single argument which is the number of dice. The output
# should contain the values of the dice and the probability for this combination
# to occur. The probability is expressed as a decimal value between 0 and 1
# with 3 decimal points.

class RollTheDice
  def initialize
    prompt_for_user_input
  end

  def roll_dice(number_of_dice)
    roll_values = (1..number_of_dice).to_a.map { |num| random_num }
    return "Rolls are: #{roll_values} #{calculate_probability(number_of_dice)}"
  end

  def random_num
    return rand(1..6)
  end

  def calculate_probability(number_of_dice)
   denominator = 1

   (1..number_of_dice).to_a.each do |num|
    denominator = denominator * 6
   end

   return "(Probability: #{'%0.3f' % (number_of_dice.to_f / denominator.to_f)})"
  end

  def prompt_for_user_input
    puts "How many die would you like to roll? "
    user_input = gets.chomp.to_i
    puts "Rolling..."
    puts roll_dice(user_input)
  end
end

RollTheDice.new
