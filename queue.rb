# this file holds the queue data structure sample code for reference

# A queue is a linear data structure that follows the FIFO rule:
# First In, First Out
# Core operations:
# Enqueue - Add item to the end.
# Dequeue - Remove item from the front.
# Peek - Look at the front item.
# is_empty? -Check if the queue is empty

class Queue
  def initialize
    @queue = [] # Arrays to store queue items
  end

  def enqueue(item)
    @queue.push(item) #Adds to the end of the queue
    puts "Enqueued #{item}"
  end

  def dequeue
    removed = @queue.shift # removes from the front (first item)
    puts "Dequeued #{removed}"
    removed
  end

  def peek
    front = @queue.first  # Looks at the front item without removing
    puts "Front of the queue is #{front}"
    front
  end

  def is_empty?
    empty = @queue.empty?
    puts "Queue is #{empty ? 'empty' : 'not empty'}"
    empty
  end

  def show
    puts "Current Queue: #{@queue.inspect}"
  end
end

# === Using the Queue ===
queue = Queue.new
queue.enqueue("Alice")
queue.enqueue("Bob")
queue.enqueue("Charlie")
queue.show       # ["Alice", "Bob", "Charlie"]
queue.peek       # "Alice"
queue.dequeue    # removes "Alice"
queue.show       # ["Bob", "Charlie"]
queue.is_empty?  # false
queue.dequeue
queue.dequeue
queue.is_empty?  # true
