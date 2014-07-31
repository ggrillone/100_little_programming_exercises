#!/usr/bin/env ruby

# Write a program which reads strings from standard input and sorts them using
# the Bubblesort algorithm.

class Bubblesort
  def initialize
    prompt_user_for_input
  end

  def sort_strings(str_list)
    swapped = false

    str_list.each_with_index do |str, i|
      if str_list[i + 1] != nil && str > str_list[i + 1]
        str_list = swap(str_list, str_list[i + 1], str, i, i + 1)
        swapped = true
      end
    end

    return swapped == true ? sort_strings(str_list) : str_list
  end

  def swap(list, item1, item2, index1, index2)
    list[index1] = item1
    list[index2] = item2
    return list
  end

  def prompt_user_for_input
    puts "Enter a series of words, each separated by a space, then I will sort them for you: "
    str = gets.chomp.split(' ')
    puts sort_strings(str)
  end
end

Bubblesort.new
