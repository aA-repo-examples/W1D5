require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder
  attr_reader :root, :row, :col
  
  def initialize(pos)
    @root = PolyTreeNode.new(pos)
    @row, @col = pos
    @visited = []
  end
    
  def new_move_position(pos)
    new_moves = KnightPathFinder.valid_moves(pos).select do |arr| 
      row, col = arr
      (0..7) === row && (0..7) === col && !visited.include?(arr)
    end
    @vistied += new_moves
    new_moves
  end
  
  def self.valid_moves(pos)
    row, col = pos
    [[row + 1, col + 2], [row + 1, col - 2],
     [row - 1, col + 2], [row - 1, col - 2],
     [row + 2, col + 1], [row + 2, col - 1],
     [row - 2, col + 1], [row - 2, col - 1]]
  end
end