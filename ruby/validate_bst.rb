class Node
    attr_reader :value
    attr_reader :left
    attr_reader :right
    def initialize(value, left, right)
        @value = value
        @left = left
        @right = right
        self
    end
end

def helper(node, lower, upper)
    if node.nil? # if leaf node
        return true
    end
    if (not (lower..upper).include?(node.value)) || # if value is out of bounds
       (not helper(node.right, node.value, upper)) || # if left-subtree is not bst
       (not helper(node.left, lower, node.value)) # if right-subtree is not bst
        return false
    end
    return true
end

def is_valid_bst(root)
    helper(root, -1 * Float::INFINITY, Float::INFINITY)
end

tree1 = 
    Node.new(8,
        Node.new(3,
            Node.new(1, nil, nil),
            Node.new(6, 
                Node.new(4, nil, nil),
                Node.new(7, nil, nil)
            )
            ),
            Node.new(10,
                nil,
                Node.new(14,
                    Node.new(13, nil, nil),
                    nil)
                )
        )

tree2 =
    Node.new(4,
        Node.new(2,
            Node.new(1, nil, nil),
            Node.new(3, nil, nil)),
        Node.new(5, nil, nil)
    )


p is_valid_bst(tree1) # => true
p is_valid_bst(tree2) # => true

=begin
Time complexity is [ O(n) where n: number of nodes in the tree

Space complexity is O(d) where d: depth of the tree.
Imperative languages usually don't implement tail-call optimization. So
a everytime helper is call a new item is added to the call stack.
=end