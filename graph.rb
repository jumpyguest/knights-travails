require_relative 'vertex'

class Graph
  attr_reader :board

  SIZE = 4
  DIRECTION = [[-2, -1], [-1, -2], [-2, 1], [-1, 2], [2, -1], [1, -2], [2, 1], [1, 2]]

  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE) }
  end

  def build_graph
    @board.each_with_index do |row, x|
      row.each_with_index do |vertex, y|
        @board[x][y] = Vertex.new(x, y)
        get_viable_moves(@board[x][y])
      end
    end
  end

  def get_viable_moves(vertex)
    p vertex.coordinates
    vertex.viable_moves = DIRECTION.map do |move|
      [vertex.x + move.first, vertex.y + move.last]
    end
    vertex.viable_moves.select! do |array|
      array.first.between?(0, SIZE - 1) && array.last.between?(0, SIZE - 1)
    end
    p vertex.viable_moves
  end

  def knight_moves(origin_coordinates, destination_coordinates)
    origin_vertex = @board[origin_coordinates[0]][origin_coordinates[1]]
    order = level_order(origin_vertex, destination_coordinates)
  end

  def level_order(origin_vertex, dest_coordinates)
    queue = []
    vertices_order = []

    queue.push(origin_vertex)
    until queue.empty?
      current_vertex = queue.shift
      vertices_order << current_vertex
      return vertices_order if current_vertex.coordinates == dest_coordinates

      current_vertex.viable_moves.each do |adj_coordinates|
        vertex = @board[adj_coordinates[0]][adj_coordinates[1]]
        vertex.preceding_pos = current_vertex.coordinates
        queue.push(vertex) unless vertices_order.include?(vertex)
      end
    end
  end
end

graph = Graph.new
graph.build_graph
p "printing board #{graph.board[2][2].viable_moves})"
pathway = graph.knight_moves([0, 0], [3, 2])
pathway.each { |element| p element.coordinates }
