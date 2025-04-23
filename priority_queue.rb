# This file holds the priority queue data structure code implementation sample for reference

# A priority queue is like a normal queue, but each item has a priority, 
# and the item with the highest priority gets served first — not necessarily the one added first.

class PriorityQueue
  def initialize
    @queue = []
  end

  def enqueue(item, priority)
    @queue << [item, priority]
    @queue.sort_by! { |x| -x[1] } # Higher priority comes first
  end

  def dequeue
    item = @queue.shift    # Remove highest priority item
    puts "Dequeued: #{item[0]} with priority #{item[1]}"
    item[0]
  end

  def show
    puts "Queue: #{@queue.map { |x| "#{x[0]}(#{x[1]})" }.join(', ')}"
  end
end

# === Example Usage ===
pq = PriorityQueue.new
pq.enqueue("Alice", 2)
pq.enqueue("Bob", 5)
pq.enqueue("Charlie", 1)
pq.show         # Bob(5), Alice(2), Charlie(1)
pq.dequeue      # Bob
pq.show         # Alice(2), Charlie(1)
