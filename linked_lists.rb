# frozen_string_literal: true

# Node class, contains value and next_node attributes
class Node
  attr_accessor :value, :next_node

  def initialize
    @value = nil
    @next_node = nil
  end
end

# LinkedList Class, implements a new LinkedList by using Node Class
class LinkedList
  attr_reader :size

  def initialize
    @head = nil
    @tail = nil
    @size = 0
  end

  def append(value)
    new_node = create_node(value)

    if @head.nil?
      @head = new_node
    else
      @tail.next_node = new_node
    end

    @tail = new_node
    @size += 1
  end

  def prepend(value)
    new_node = create_node(value)

    if @head.nil?
      @tail = new_node
    else
      new_node.next = @head
    end

    @head = new_node
    @size += 1
  end

  def head
    return if @head.nil?

    @head
  end

  def tail
    return if @tail.nil?

    @tail
  end

  def to_s
    return if @head.nil?

    current_node = @head

    until current_node.nil?
      print "( #{current_node.value} ) -> "
      current_node = current_node.next_node
    end

    puts 'nil'
  end

  private

  def create_node(value)
    node = Node.new
    node.value = value
    node
  end
end

new_list = LinkedList.new
new_list.append(10)
new_list.to_s

