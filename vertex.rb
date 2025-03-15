class Vertex
  attr_reader :x, :y
  attr_accessor :viable_moves

  def initialize(x, y)
    @x = x
    @y = y
    viable_moves = []
  end
end
