# knights-travails

The function knight_moves of the Graph class shows the shortest possible way to get from one square to 
another by outputting all squares the knight will stop on along the way on
an 8x8 chessboard. Uses Breadth-First Search algorithm.

This repository contains solutions for the Knights Travails project.
1. Implementation of the Graph class and required methods.
2. Implementation of the Vertex class and required method.

## Classes

### Graph
Class that represents a graph of the knight's possible moves on the chessboard.
```ruby
class Graph
  SIZE = 8
  DIRECTION = [[-2, -1], [-1, -2], [-2, 1], [-1, 2], [2, -1], [1, -2], [2, 1], [1, 2]]

  def initialize
    @board = Array.new(SIZE) { Array.new(SIZE) }
  end
...
```
**Methods**
- **#build_graph** - builds a graph that represents the knight's possible moves on all locations of the chess board.
- **#get_viable_moves(vertex)** - retrieves the viable moves of the knight in the specified vertex or location.
  Returns an array of coordinates.
- **#knight_moves(origin_coordinates, destination_coordinates)** - method that shows the shortest possible way to get from one square to another
  by outputting all squares the knight will stop on along the way.
- **#level_order(origin_vertex, dest_coordinates)** - Traverses all the possible paths to get to the target coordinates. Returns an array of visited
  vertices.
- **#rebuild_path(order)** - rebuilds the path from the array of visited vertices starting from the destination back towards the origin. Returns
  the an array of coordinates from origin to destination.

### Vertex
Class that represents each square on the chess board visited.
```ruby
class Vertex
  attr_reader :x, :y
  attr_accessor :viable_moves, :preceding_pos

  def initialize(x, y)
    @x = x
    @y = y
    @viable_moves = []
    @preceding_pos = nil
  end
...
```
**Methods**
- **#coordinates** - returns the coordinates of the vertex object.

## Files
- **graph.rb** - Contains implementation of the Graph class.
- **vertex.rb** - Contains implementation of the Vertex class.
- **main.rb** - driver script to test the implementation.
