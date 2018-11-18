
def game_array(size)
  array = Array.new(size * size)
  counter = 0
  array.each do
    array[counter] = true
    counter += 1
  end  
  return array
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
  return neighbor_array
end
def find_new_state(state, index, size)
  array = game_array(3)
  neighbors = find_neighbors(index, array)
  neighbors = [false]
  if neighbors.include?(true) == false 
    state = false
  end
  return state   
end
# class Start_game
#   def initialize

