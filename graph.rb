require_relative 'vertex'

class Graph
  SIZE = 4
  DIRECTION = [[-2, -1], [-1, -2], [-2, 1], [-1, 2], [2, -1], [1, -2], [2, 1], [1, 2]]

  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE) }
  end

  def build_graph
    @board.each_with_index do |row, x|
      row.each_with_index do |vertex, y|
        vertex = Vertex.new(x, y)
        get_viable_moves(vertex)
      end
    end
  end

  def get_viable_moves(vertex)
    origin = [vertex.x, vertex.y]
    p origin
    vertex.viable_moves = DIRECTION.map do |move|
      [origin.first + move.first, origin.last + move.last]
    end
    vertex.viable_moves.select! do |array|
      array.first.between?(0, SIZE - 1) && array.last.between?(0, SIZE - 1)
    end
    p vertex.viable_moves
  end
end

graph = Graph.new
graph.build_graph
