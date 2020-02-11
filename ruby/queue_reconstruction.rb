
def reconstruct(queue)
    queue.sort! {|item1, item2| item2[0] <=> item1[0] }
    p queue
    res = Array.new queue.length, nil
    queue.each do |item|
      res = insert(res, queue.length, item[1], item)
    end
    res.select{|item| not item.nil? }
end

def insert(list, size, index, item)
  if list[index].nil?
    list[index] = item
  else
    list.insert(index, item)
  end
  list
end


p reconstruct([[7, 0], [4, 4], [7, 1], [5, 0], [6, 1], [5, 2]])

