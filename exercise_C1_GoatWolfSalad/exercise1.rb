#!/usr/bin/env ruby

# A goat, a wolf, and a salad are on one side of a river and you need to get them to the other
# side using your boat. You can carry one item in your boat to the other side at any given time.
# However, when the goat and the wolf are left alone the wolf will eat the goat. If the goat and
# the salad are left alone the goat will eat the salad. As long as you are with them nothin will
# happen, ie. the wolf won't eat the goat and the goat won't eat the salad.
#
# Write a program which determines algorithmically an order in which you carry them all to the
# other side.
#
# Pseudo code:
#
# [goat,wolf,sald].each do |object|
#    if check_for_valid_move(object) == true
#      move_to_left_side_of_river(object)
#    end
#  end

class GoatWolfSalad
  attr_accessor :boat_arr, :right_side_of_river_arr, :left_side_of_river_arr

  def initialize
    puts "Beginning movement of The goat, the wolf, and the salad..."
    @boat_arr = ['driver']
    @right_side_of_river_arr = ['goat', 'wolf', 'salad']
    @left_side_of_river_arr = []
    ferry_objects_across_river
  end

  def ferry_objects_across_river
    @right_side_of_river_arr.each_with_index do |object, i|
      puts "Calculating if I can ferry over the #{object} from the right side of the river to the left.."
      valid_move = check_right_to_left_rules(object, i)
      if valid_move[:is_valid] == true
        puts "Yes! I can move the #{object} to the left side of the river"
        load_boat(object, valid_move[:direction])
        break
      end
    end
  end

  def check_right_to_left_rules(object, index)
    @right_side_of_river_arr.delete(object)
    @left_side_of_river_arr.push(object)
    valid_move = { is_valid: true, direction: 'left' }

    if @right_side_of_river_arr.include?('goat') && @right_side_of_river_arr.include?('wolf')
      puts "Uh oh, can't do that the wolf will eat the goat!"
      valid_move[:is_valid] = false
    elsif @right_side_of_river_arr.include?('goat') && @right_side_of_river_arr.include?('salad')
      puts "Uh oh, can't do that the goat with eat the salad!"
      valid_move[:is_valid] = false
    end

    if @left_side_of_river_arr.include?('goat') && @left_side_of_river_arr.include?('wolf')
      puts "Uh oh, can't do that the wolf will eat the goat!"
      valid_move[:is_valid] = false
    elsif @left_side_of_river_arr.include?('goat') && @left_side_of_river_arr.include?('salad')
      puts "Uh oh, can't do that the goat with eat the salad!"
      valid_move[:is_valid] = false
    end

    if valid_move[:is_valid] == true
      @left_side_of_river_arr.delete(object)
    else
      if @left_side_of_river_arr > 1
        puts "Now maybe let's see if I can bring anything from the left side back to the right side of the river, maybe that will do it..."
        valid_move = check_left_to_right_rules
        if valid_move[:is_valid] == true
          @left_side_of_river_arr.delete(object)
        else
          keep_object_on_right_side_of_river(object, index)
        end
      else
        keep_object_on_right_side_of_river(object, index)
      end
    end

    return valid_move
  end

  def check_left_to_right_rules
    
  end

  def keep_object_on_right_side_of_river(object, index)
    @right_side_of_river_arr.insert(index, object)
    @left_side_of_river_arr.delete(object)
  end

  def load_boat(object, direction)
    if @boat_arr.count == 1
      puts "I'm loading up the #{object} onto the boat!"
      @boat_arr[1] = object
      return direction == 'left' ? ferry_object_to_left_side_of_river : ferry_object_to_right_side_of_river
    else
      puts "Uh oh! My boat is full, I messed up!"
    end
  end

  def ferry_object_to_left_side_of_river
    puts "Now driving over to the left side of the river!"
    @left_side_of_river_arr.push(@boat_arr[1])
    @boat_arr.delete(@boat_arr[1])
    puts "Moving back to the right side of the river, let's see what we have left: "
    output_stats

    ferry_objects_across_river if @right_side_of_river_arr.count > 0
  end

  def ferry_object_to_right_side_of_river
  end

  def output_stats
    puts "One the left side of the river we have: #{@left_side_of_river_arr.join(' ')}"
    puts "And on the right side of the river we still have: #{@right_side_of_river_arr.join(' ')}"
  end
end

GoatWolfSalad.new
