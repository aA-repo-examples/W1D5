require_relative "../skeleton/lib/00_tree_node.rb"

class KnightPathFinder
  attr_reader :pos
  
  def initialize(pos)
    @root  = PolyTreeNode.new(pos)
    @pos   = pos
    @seen  = [pos]
    build_move_tree
  end
  
  def find_path(end_pos)
    trace_path_back(@root.bfs(end_pos))  
  end
  
  def inspect
    "#<Knight Path Finder with initial position at #{pos}>"
  end
  
  private
  
  attr_accessor :seen, :root
  
  def trace_path_back(node)
    return [pos] if node == @root
    
    trace_path_back(node.parent) << node.value
  end  
  
  def new_move_position(pos)
    new_moves = KnightPathFinder.valid_moves(pos)
      
    new_moves.select! do |move|
      !@seen.include?(move) && 
        move.none?{|el| el > 7 || el < 0}
    end
    
    @seen += new_moves
    new_moves.map { |move| PolyTreeNode.new(move) }
  end
  
  def build_move_tree
    queue = [@root]
    
    until queue.empty?
      parent = queue.shift
      children = new_move_position(parent.value)
      
      children.each {|child| child.parent = parent}
      
      queue += children
    end
  end
  
  def self.valid_moves(pos)
    row, col = pos
    [[row + 1, col + 2], [row + 1, col - 2],
     [row - 1, col + 2], [row - 1, col - 2],
     [row + 2, col + 1], [row + 2, col - 1],
     [row - 2, col + 1], [row - 2, col - 1]]
  end
  
end