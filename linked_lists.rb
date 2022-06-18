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
      new_node.next_node = @head
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

  def at(index)
    puts "\nIncorrect index value" unless index.positive?

    current_node = @head
    current_index = 0

    until current_node.nil?
      break if current_index == index

      current_index += 1
      current_node = current_node.next_node
    end

    current_node
  end

  def pop
    return if @head.nil?
  end

  def contains?(value)
    return false if @head.nil?

    current_node = @head

    until current_node.nil?
      return true if current_node.value == value

      current_node = current_node.next_node
    end

    false
  end

  def find(value)
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
  
  def insert_at(value, index)
  end

  def remove_at(index)
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
new_list.append(20)
new_list.append(30)

new_list.to_s

new_list.prepend(3)
new_list.prepend(2)
new_list.prepend(1)

new_list.to_s
puts new_list.at(3).value
