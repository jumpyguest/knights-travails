require_relative 'vertex'

class Graph
  SIZE = 8
  DIRECTION = [[-2, -1], [-1, -2], [-2, 1], [-1, 2], [2, -1], [1, -2], [2, 1], [1, 2]]

  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE) }
  end

  def build_graph
    @board.each_with_index do |row, x|
      row.each_with_index do |_vertex, y|
        @board[x][y] = Vertex.new(x, y)
        get_viable_moves(@board[x][y])
      end
    end
  end

  def get_viable_moves(vertex)
    vertex.viable_moves = DIRECTION.map { |move| [vertex.x + move.first, vertex.y + move.last] }
    vertex.viable_moves.select! { |array| array.first.between?(0, SIZE - 1) && array.last.between?(0, SIZE - 1) }
  end

  def knight_moves(orig_coord, dest_coord)
    order = level_order(@board[orig_coord[0]][orig_coord[1]], dest_coord)
    path = rebuild_path(order)
    puts "You made it in #{path.size - 1} moves! Here's your path:"
    path.each { |move| p move }
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
        next if vertices_order.include?(vertex) || queue.include?(vertex)

        vertex.preceding_pos = current_vertex.coordinates
        queue.push(vertex)
      end
    end
  end

  def rebuild_path(order)
    path = []

    path << order.pop
    path.last.preceding_pos == order.last.coordinates ? path << order.pop : order.pop until order.empty?
    path.reverse!.map(&:coordinates)
  end
end
