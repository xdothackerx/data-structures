class Node
  attr_accessor :value, :prev_node, :next_node

  def initialize(value, prev_node = nil)
    @value = value
    @prev_node = prev_node
  end
end

class List
  attr_accessor :last_node

  def add(value)
    current = Node.new(value)
    if @last_node != nil
      current.prev_node = @last_node
      @last_node.next_node = current
    end
    @last_node = current
  end

  def search(value)
    current_loc = @last_node
    result = nil
    while current_loc != nil
      if current_loc.value == value
        result = current_loc
      end
      current_loc = current_loc.prev_node
    end
    return result
  end

  def delete(node)
    node.prev_node.next_node = node.next_node
    node.next_node.prev_node = node.prev_node
  end

  def to_s
    current_loc = @last_node
    result = ""
    while current_loc != nil
      value = current_loc.value
      if value.is_a?(Symbol)
        result += ":" + value.to_s + " ,"
      elsif value.is_a?(String)
        result += "'" + value.to_s + "' ,"
      else
        result += value.to_s + " ,"
      end
      current_loc = current_loc.prev_node
    end
    return result.chomp(" ,").reverse
  end

  def deduplicate
    current_loc = @last_node
    arr = []
    while current_loc != nil
      arr << current_loc.value
      current_loc = current_loc.prev_node
    end
    list = List.new
    arr.uniq.each do |value|
      list.add(value)
    end
    list
  end

  def dedup
    current_loc = @last_node
    new_list = List.new
    while current_loc != nil
      if new_list.search(current_loc.value) == nil
        new_list.add(current_loc.value)
      end
    end
    list = new_list
  end
end
