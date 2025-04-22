# this file holds a sample Stack data structure code for reference

# A stack is a linear data structure that follows the LIFO rule:
# Last In, First Out
class Stack
  def initialize
    @stack = [] # This is the array that holds our stack item
  end

  def push(item)
    @stack.push(item) # Adds item to the top (end of array)
    puts "Pushed #{item}"
  end

  def pop
    removed = @stack.pop # Removes and returns the last item
    puts "Popped #{removed}"
    removed
  end

  def peek
    top = @stack.last # Looks at the  last item without removing
    puts "Top of the stack is #{top}"
    top
  end

  def is_empty?
    empty = @stack.empty? # Returns true if the stack has no items
    puts "Stack is #{empty ? 'empty' : 'not empty'}"
    empty
  end

  def show
    puts "current Stack: #{@stack.reverse.inspect}" #Show top at the left
  end
end

# === Using the Stack ===
stack = Stack.new
stack.push(10)
stack.push(20)
stack.push(30)    # console outputs
stack.show        # ==> [30, 20, 10]
stack.peek        # ==> Top of the stack is 30
stack.pop         # ==> Popped 30
stack.show        # ==> [20, 10]
stack.is_empty?   # ==> Stack is not empty
stack.pop         # ==> Popped 20
stack.pop         # ==> Popped 10
stack.is_empty?   # ==> Stack is empty