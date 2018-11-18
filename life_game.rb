class Starting_array
  def initialize(size)
    game_array(size)
  end  
  def game_array(size)
    @array = Array.new(size * size)
    counter = 0
    @array.each do
      dead_or_alive = [true, false].shuffle
      @array[counter] = dead_or_alive[0]
      counter += 1
    end  
  @array
  end
  attr_reader :array
end
class Grid_builder
  def initialize(array)
    build_grid(array)
  end
  def build_grid(array)
    size = Math.sqrt(array.count).to_i
    @grid = ""
    counter = 0
    array.each_with_index do |state, index|
      if state == true
        @grid << " true"
      else
        @grid << "false"
      end
      case counter
      when 0..size-2 then @grid << "|"
      when size-1 then
        count = 1
        size.times do
          case count
          when 1 then @grid << "\n------" unless index == array.count - 1
          when 2..size-1 then @grid << "------" unless index == array.count - 1
          when size then @grid << "------\n" unless index == array.count - 1
          end
          count += 1
        end
      end
      counter += 1
      if counter == size
        counter = 0
      end
    end
    @grid
  end
  attr_reader :grid
end

class Build_neighbor_array
  def initialize(index, array)
    find_neighbors(index, array)
  end  
  def find_neighbors(index, array)
    neighbor_array = []
    right_side = index + 1
    size = Math.sqrt(array.count).to_i
    end_row_first = array.count - size          
    unless right_side % size == 0
      neighbor1 = index + 1
      neighbor_array << neighbor1
    end  
    unless index % size == 0
      neighbor2 = index - 1
      neighbor_array << neighbor2
    end
    unless (end_row_first..array.count).include?(index)
      neighbor3 = size + index
      neighbor_array << neighbor3
    end    
    unless right_side % size == 0 || (end_row_first..array.count).include?(index)
      neighbor4 = size + index + 1
      neighbor_array << neighbor4
    end  
    unless index % size == 0 || (end_row_first..array.count).include?(index)
      neighbor5 = size + index - 1
      neighbor_array << neighbor5
    end 
    unless index - size < 0
      neighbor6 = index - size 
      neighbor_array << neighbor6
    end
    unless index - size < 0 || right_side % size == 0 
      neighbor7 = index - size + 1
      neighbor_array << neighbor7
    end  
    unless index % size == 0 || index - size < 0
      neighbor8 = index - size - 1
      neighbor_array << neighbor8
    end  
    @neighbor_array = neighbor_array
  end
  attr_reader :neighbor_array
end

class Change_state
  def initialize(array)
    find_new_state(array)
  end
  def find_new_state(array)
    update_array = []
    array.each_with_index do |state, index|
      true_count = 0
      neighbors = Build_neighbor_array.new(index, array).neighbor_array
      neighbors.each do |element|
        if array[element] == true
          true_count += 1
        end          
      end
      if state == true && true_count < 2
        update_array << false
      elsif state == true && true_count > 3
        update_array << false
      elsif true_count == 3
        update_array << true
      elsif state == true && true_count == 2
        update_array << true
      elsif state == false && true_count != 3
        update_array << false
      end 
    end
    @array = update_array
  end
  attr_reader :array   
end

class Playing_game
  def initialize(array)
    iterations(array)
  end
  def iterations(array)
    if array.include?(true)
      updated_array = Change_state.new(array).array
      updated_grid = Grid_builder.new(updated_array).grid
      system "cls"
      puts updated_grid
      sleep 2
      iterations(updated_array)
    else
      system "cls"
      last_grid = Grid_builder.new(array).grid
      puts last_grid
      puts "Game Over"
    end  
  end
end

class Start_game
  def initialize
    system "cls"
    puts "Enter Board Size:"
    size = gets.chomp.to_i
    if size < 1
      system "cls"
      puts "Not Valid Try Again"
      sleep 1
      Start_game.new
    else
      system "cls"
      array = Starting_array.new(size).array
      grid = Grid_builder.new(array).grid
      puts grid
      Playing_game.new(array)
    end
  end    
end

Start_game.new

