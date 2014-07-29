#!/usr/bin/env ruby

# Write a program which reads the contents of a file and which counts the number of words and lines in that file.

class FileReader
  attr_accessor :file

  def initialize
    @file = nil
    prompt_user_for_input
  end

  def open_file(file_path)
    File.open(file_path, 'r')
  end

  def get_file_stats(file_str)
    @file = open_file(file_str)
    get_number_of_lines_and_words
  end

  def get_number_of_lines_and_words
   number_of_lines = 0
   number_of_words = 0
    @file.each_line do |line|
      number_of_lines = number_of_lines + 1
      number_of_words = number_of_words + line.split(' ').count
    end

   puts "#{@file.path} contains #{number_of_words} words in #{number_of_lines} lines"
  end

  def prompt_user_for_input
    puts "Please input the path and file name of the file you want me to read from: "
    file = gets.chomp
    get_file_stats(file)
  end
end

FileReader.new
