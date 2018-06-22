
class PolyTreeNode
  attr_accessor :children
  
  def initialize(value = 0)
    @value = value
    @parent = nil
    @children = []
  end
  
  def parent
    @parent
  end
  
  def parent=(new_parent)
    return @parent = nil if new_parent.nil?
    parent.remove_child(self) if parent
    @parent = nil
    new_parent.add_child(self) if new_parent
    @parent = new_parent
  end
  
  def value
    @value
  end
  
  def add_child(child)
    return nil if child.nil?
    unless children.include? child
      children << child 
      child.parent = self
    end
  end
  
  def remove_child(child)
    raise "Not a child" unless children.include?(child)
    
    children.delete(child)
    child.parent = nil
  end
  
  def dfs(target_value)
    return self if target_value == value
    children.each do |child|
      node = child.dfs(target_value)
      return node if node
    end
    nil
  end
  
  def bfs(target_value)
    queue = [self]
    
    until queue.empty?
      node = queue.shift
      
      return node if node.value == target_value
      queue += node.children
    end
    nil
  end
  
  def inspect
    "#<#{value}>"
  end
  
  
end
