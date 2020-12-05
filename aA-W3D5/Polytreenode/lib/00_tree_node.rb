require "byebug"

class PolyTreeNode
    attr_reader :value, :parent
    def initialize(value = nil, children = [])
        @value = value
        @parent = nil
        @children = []
    end 

    def children
      @children
    end

    def parent=(node) # child = self
        self.parent.children.delete(self) if self.parent
        @parent = node
        self.parent.children << self unless self.parent.nil?
        self
    end 

    def add_child(node)
        node.parent = self 
    end 

    def remove_child(node)
        node.parent = nil
        raise "not child" if !self.children.include?(node)

    end 
    
    def dfs(target)
        return self if self.value == target
        self.children.each do |child|
             search_result = child.dfs(target)
            return search_result unless search_result.nil?
        end
        nil
    end 

    def bfs(target)
        queue = [self]
        until queue.empty?
            elem = queue.shift
            if elem.value == target
                return elem
            else
                elem.children.each { |child| queue << child }
            end
        end
        nil
    end 
end 