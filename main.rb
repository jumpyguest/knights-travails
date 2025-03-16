require_relative 'lib/graph'

graph = Graph.new
graph.build_graph
graph.knight_moves([0, 0], [7, 7])
