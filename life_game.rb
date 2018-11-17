def alive_cell(index_hash) 
  index_hash.each do |key, value|
    if value == true
      return value
    else
      return value
    end    
  end
end

class Draw_grid
  def initialize()
    grid()
    make_grid()
  end  
  def grid()
    index_array = []
    array = Array.new(9).map.with_index{ |x, i| i }
    array.each do |element|
        index_array << element
        index_array << true
    end
    @index_hash = Hash[*index_array]      
    return @index_hash
  end 
  def make_grid()
    @the_grid = ""
    @index_hash.keys.each do |a|
      @the_grid << index
      case index % 3                                     
      when 0, 1 then @the_grid << "|"
      when 2 then @the_grid << "\n-----------\n" unless index == 8
      end
    end
    return @the_grid  
  end
  attr_reader :the_grid
  attr_reader :index_hash
end
this = Draw_grid.new
puts this.index_hash.keys
p this.the_grid      

