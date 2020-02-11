class Node

  attr_accessor :head
  attr_accessor :tail
  
  def initialize(value)
    @head = value
    @tail = nil
  end
end

def add(l1, l2)
  helper(l1, l2, 0)
end

def helper(l1, l2, carry_over)
  v = l1.head + l2.head + carry_over
  c = v / 10
  r = Node.new(v % 10)
  if ((not l1.tail.nil?) || (not l2.tail.nil?))
    if l1.tail.nil?
     l1.tail = Node.new 0
    end
    if l2.tail.nil?
     l2.tail = Node.new 0
    end
    r.tail = helper(l1.tail, l2.tail, c)
  elsif (not c.zero?)
    r.tail = Node.new c
  end
  return r
end

# 243 + 564 =  807

l1 = Node.new(2)
l1.tail = Node.new(4)
l1.tail.tail = Node.new(3)

l2 = Node.new(5)
l2.tail = Node.new(6)
l2.tail.tail = Node.new(4)

result = add(l1, l2)

# => 7 0 8
while (not result.head.nil?)
  p result.head
  result = result.tail
end


# Time complexity is O(Max(m, n)). Where m: length of l1 and n: length of l2
# Space complexity is also O(Max(m, n)). A more space-efficient algorithm can be implemented
# recursively but the readability will suffer.