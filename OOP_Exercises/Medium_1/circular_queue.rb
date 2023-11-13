=begin

input: 
enqueueinteger

queue - an collaborator object within a class- a buffer with 3 object
the buffer is circular
objects added are after the most recently added object
removing objects removes the oldest object in the queue
adding new objects removes the oldest and puts newest in it's place

- enqueue (class method) to add an object to the queue
array add object (oldest object)
find oldest object 
1 2 3
- dequeue (class method) to remove (and return) the oldest object in the queue. It should return nil if the queue is empty.

queue = CircularQueue.new(3) 
puts queue.dequeue == nil 

array 
[x, y, z]

=end


class CircularQueue
  attr_accessor :queue, :size

  def initialize(size)
    @queue = Array.new
    @size = size
  end

  def enqueue(num)
    queue << num
    queue.shift if queue.size > size
  end

  def dequeue
    queue.shift
  end
end



queue = CircularQueue.new(3)

p queue
p queue.dequeue
p queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
p queue.queue
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil

queue = CircularQueue.new(4)
puts queue.dequeue == nil

queue.enqueue(1)
queue.enqueue(2)
puts queue.dequeue == 1

queue.enqueue(3)
queue.enqueue(4)
puts queue.dequeue == 2

queue.enqueue(5)
queue.enqueue(6)
queue.enqueue(7)
puts queue.dequeue == 4
puts queue.dequeue == 5
puts queue.dequeue == 6
puts queue.dequeue == 7
puts queue.dequeue == nil