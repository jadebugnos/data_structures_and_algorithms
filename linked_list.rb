# this file holds the linked list data structure code implementation sample

# What is a linked list?
# - a linked list is a sequence of elements where each element(node) contains:
# 1. A value (the actual data)
# 2. A pointer (reference) to the next node in the list
# so it's like: 
# [10] → [20] → [30] → nil
# unlike arrays, linked lists don't use indexes. You access items by following links one
# at a time
# pros and cons :
# - Fast insertion/deletion (no shifting like arrays)
# - slower access(no direct indexing)
# - Great when working with dynamic or unknown sizes

# Step 1: Create a Node class
class Node
  attr_accessor :data, :next

  # Initialize a new node with a value (data)
  def initialize(data)
    @data = data  # The value stored in this node
    @next = nil   # Pointer to the next node (default is none)
  end
end

# Step 2: Create a LinkedList class
class LinkedList
  def initialize
    @head = nil   # Start with an empty list (no first node)
  end

  # Add a new node at the end of the list
  def append(value)
    new_node = Node.new(value)  # Create a new node with the given value
  
    # If the list is empty, the new node becomes the head
    if @head.nil?
      @head = new_node
    else
      current = @head   # Start from the head
      # Move forward until we reach the last node
      current = current.next while current.next
      # Set the next of the last node to the new node
      current.next = new_node
    end
  end

  def prepend(value)
    new_node = Node.new(value)
    new_node.next = @head      # Point the new node to the current head
    @head = new_node           # Set the new node as the new head
  end

  def delete(value)
    return if @head.nil?

    # If the head is the one to delete
    if @head.data == value
      @head = @head.next
      return
    end

    current = @head
    while current.next && current.next.data != value
      current = current.next
    end

    # if found, bypass the node to delete it
    current.next = current.next.next if current.next
  end

  def reverse
    previous = nil
    current = @head
  
    while current
      next_node = current.next     # Temporarily store the next node
      current.next = previous      # Reverse the link
      previous = current           # Move previous forward
      current = next_node          # Move current forward
    end
  
    @head = previous               # Reset head to the new front
  end
  

  def print_list
    current = @head   # Start at the head
    while current     # Loop until we reach nil (end of list)
      print "#{current.data} -> " # Print the current node's data
      current = current.next      # Move to the next node
    end
    puts "nil"                    # Shows the end of the list
  end
end

# === Example Usage ===

list = LinkedList.new   # Create a new linked list

puts "Appending elements:"
list.append(10)         # Add 10 at the end
list.append(20)         # Add 20 at the end
list.append(30)         # Add 30 at the end
list.print_list         # Output: 10 -> 20 -> 30 -> nil

puts "\nPrepending element:"
list.prepend(5)         # Add 5 at the beginning
list.print_list         # Output: 5 -> 10 -> 20 -> 30 -> nil

puts "\nDeleting element (20):"
list.delete(20)         # Remove node with value 20
list.print_list         # Output: 5 -> 10 -> 30 -> nil

puts "\nReversing list:"
list.reverse            # Reverse the order of the list
list.print_list         # Output: 30 -> 10 -> 5 -> nil

