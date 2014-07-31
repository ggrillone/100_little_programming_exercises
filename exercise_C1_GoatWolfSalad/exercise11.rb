#!/usr/bin/env ruby

class GoatWolfSalad
  attr_accessor :boat, :right_side_of_river, :left_side_of_river

  # Initialize the data and begin moving
  # items from right to left
  def initialize
    @boat = ['driver']
    @right_side_of_river = ['goat', 'wolf', 'salad'].shuffle
    @left_side_of_river = []
    puts "Beginning program..."
    move_to_right_side_of_river
  end

  # Move boat driver to the right side of the river
  def move_to_right_side_of_river
    puts "I am now on the right side of the river."
    begin_moving_right_to_left
  end

  # Initialize transport of item from the right to the left
  def begin_moving_right_to_left
    puts "Let's try moving some objects from the right side of the river to the left side."
    @right_side_of_river.each_with_index do |object, i|
      if @left_side_of_river.count >= 3 && @right_side_of_river.count == 0
        break
      else
        if ferry_object_to_other_side(object, 'left') == true
          break
        else
          @right_side_of_river.insert(i, object)
          @left_side_of_river.delete(object)
        end
      end
    end
  end

  # Initialize transport of item from left to the right
  def begin_moving_left_to_right
    successfull_move = true
    puts "Let's try moving some objects from the left side of the river back to the right side."
    @left_side_of_river.each_with_index do |object, i|
      if @left_side_of_river.count >= 3 && @right_side_of_river.count == 0
        break
      else
        if ferry_object_to_other_side(object, 'right') == true
          successfull_move = true
          break
        else
          successfull_move = false
          @left_side_of_river.insert(i, object)
          @right_side_of_river.delete(object)
        end
      end
    end

    return successfull_move
  end

  # Pick up an item on a specific side of the river
  def pick_up_object(object, direction)
    if @boat.count == 1
      puts "I just picked up the #{object}."
      @boat[1] = object
      return direction == 'left' ? @right_side_of_river.delete(object) : @left_side_of_river.delete(object)
    else
      puts "Uh oh! My boat is full!"
    end
  end

  # Ferry item to opposite side
  def ferry_object_to_other_side(object, direction)
    if @left_side_of_river.count == 3 && @right_side_of_river.count == 0
      return true
    else
      pick_up_object(object, direction)
      puts "Ferrying the #{object} to the #{direction} side of the river..."
      return drop_off_object(direction)
    end
  end

  # Drop an item off at side
  def drop_off_object(direction)
    if direction == 'left'
      @left_side_of_river.push(@boat[1])
    else
      @right_side_of_river.push(@boat[1])
    end
    puts "I just dropped off the #{@boat[1]} on the #{direction} side of the river."
    @boat.delete(@boat[1])
    check_stats

    if @left_side_of_river.count == 3 && @right_side_of_river.count == 0
      puts "Yipee Kai Yayyy Motherfucker! I did it!"
      return true
    else
      return validate(direction)
    end
  end

  # Make sure no one gets eaten!
  def validate(direction)
    puts "Now let's validate that no one will eat each other.."
    left_side_valid = validate_left_side
    right_side_valid = validate_right_side
    if left_side_valid && right_side_valid
      puts "Yay nobody was eaten! - let's go back to right side and move next object."
      move_to_right_side_of_river
      return true
    elsif direction == 'left' && !left_side_valid && @left_side_of_river.count == 2
      return begin_moving_left_to_right
    elsif direction == 'right' && !right_side_valid && @right_side_of_river.count == 2
      return begin_moving_right_to_left
    else
      puts "Uh oh, I fucked up! Let's go back."
    end
    return false
  end

  # Validate the items on the left side of the river
  def validate_left_side
    is_valid = true

    if @left_side_of_river.count < 3
      if @left_side_of_river.include?('goat') && @left_side_of_river.include?('wolf')
        puts "Uh oh! On the left side of the river it looks like the wolf will eat the goat if I leave!"
        is_valid = false
      elsif @left_side_of_river.include?('goat') && @left_side_of_river.include?('salad')
        puts "Uh oh! On the left side of the river it looks like the goat will eat the salad if I leave!"
        is_valid = false
      end
    end
    return is_valid
  end

  # Validate the items on the right side of the river
  def validate_right_side
    is_valid = true

    if @right_side_of_river.count > 0
      if @right_side_of_river.include?('goat') && @right_side_of_river.include?('wolf')
        puts "Uh oh! On the right side of the river it looks like the wolf will eat the goat if I leave!"
        is_valid = false
      elsif @right_side_of_river.include?('goat') && @right_side_of_river.include?('salad')
        puts "Uh oh! On the right side of the river it looks like the goat will eat the salad if I leave!"
        is_valid = false
      end
    end
    return is_valid
  end

  # Output to the user who is currently of the left and right sides
  def check_stats
    puts "On the left of the river we now have: #{@left_side_of_river}"
    puts "And on the right side of the river we still have: #{@right_side_of_river}"
  end
end

GoatWolfSalad.new