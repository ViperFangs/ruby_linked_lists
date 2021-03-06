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

    previous_node = @head
    current_node = @head

    until current_node.next_node.nil?
      previous_node = current_node
      current_node = current_node.next_node
    end

    popped_value = current_node.value
    previous_node.next_node = nil
    @tail = previous_node
    @size -= 1
    popped_value
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
    return nil if @head.nil?

    current_node = @head
    current_index = 0

    until current_node.nil?
      return current_index if current_node.value == value

      current_index += 1
      current_node = current_node.next_node
    end

    nil
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
    if index > size
      puts "\nIndex out of bounds"
      return
    end

    if index == size
      append(value)
      return

    elsif index.zero?
      prepend(value)
      return
    end

    current_node = @head
    previous_node = @head
    new_node = create_node(value)
    current_index = 0

    until current_node.nil?
      break if current_index == index

      current_index += 1
      previous_node = current_node
      current_node = current_node.next_node
    end

    new_node.next_node = current_node
    previous_node.next_node = new_node
    @size += 1
  end

  def remove_at(index)
    if index > size
      puts "\nIndex out of bounds"
      return
    end

    if index == size
      pop
      return

    elsif index.zero?
      @head = @head.next_node
      return
    end

    current_node = @head
    previous_node = @head
    current_index = 0

    until current_node.nil?
      break if current_index == index

      current_index += 1
      previous_node = current_node
      current_node = current_node.next_node
    end

    previous_node.next_node = current_node.next_node
    @size -= 1
  end

  private

  def create_node(value)
    node = Node.new
    node.value = value
    node
  end
end
