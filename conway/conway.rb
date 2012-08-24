
module Conway
  class Grid

    def initialize raw_cells
      @cells = []
      raw_cells.each do |raw_cell|
       @cells << Cell.new(raw_cell[0], raw_cell[1], raw_cell[2])
      end
    end

#    def add cell
#      @cells << cell
#    end

    def tick

    end

    def cell_alive? x, y
      @x, @y = x, y
      alive_count >= 2
    end

    private
    def alive_count
      neighbors(@x,@y).map {|neighbor| neighbor.is_alive? ? true : nil}.compact.count
    end

    def neighbors(x,y)
      [north_neighbor(x,y), east_neighbor(x,y), south_neighbor(x,y)]
    end

    def north_neighbor x,y
      get_cell x, y -1
    end

    def east_neighbor x,y
      get_cell x + 1, y
    end

    def south_neighbor x,y
      get_cell x, y + 1
    end

    def get_cell x, y
      @cells.select { |cell| cell.x == x && cell.y == y}.first
    end
  end

  class Cell
    attr_accessor :x, :y

    def initialize x, y, living
      @x,@y,@living = x, y, living
    end

    def is_alive?
      @living ? true : false
    end
  end


end
