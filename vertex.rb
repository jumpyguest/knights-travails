class Vertex
  attr_reader :x, :y
  attr_accessor :viable_moves, :preceding_pos

  def initialize(x, y)
    @x = x
    @y = y
    @viable_moves = []
    @preceding_pos = nil
  end

  def coordinates
    [@x, @y]
  end
end
