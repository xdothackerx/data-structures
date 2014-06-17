class Node
  attr_accessor :value, :prev_node, :next_node

  def initialize(value, prev_node = nil)
    @value = value
    @prev_node = prev_node
  end
end

class List
  attr_accessor :first_node, :last_node

  def add(value)
    current = Node.new(value)
    if @first_node == nil
      @first_node = current
    elsif @last_node != nil
      current.prev_node = @last_node
      @last_node.next_node = current
    end
    @last_node = current
  end

  def search(value)
    current_loc = @first_node
    result = nil
    while current_loc != nil
      if current_loc.value == value
        result = current_loc
      end
      current_loc = current_loc.next_node
    end
    return result
  end

  def delete(node)
    node.prev_node.next_node = node.next_node
    node.next_node.prev_node = node.prev_node
  end

  def to_s
    current_loc = @first_node
    result = ""
    while current_loc != nil
      value = current_loc.value
      if value.is_a?(Symbol)
        result += ":" + value.to_s + ", "
      elsif value.is_a?(String)
        result += "'" + value.to_s + "', "
      else
        result += value.to_s + ", "
      end
      current_loc = current_loc.next_node
    end
    return result.chomp(", ")
  end

  def deduplicate
    list = List.new
    self.to_s.split(", ").map {|n| n.to_i}.uniq.each { |value| list.add(value) }
    list
  end

  def dedup
    current_loc = @first_node
    new_list = List.new
    while current_loc != nil
      if new_list.search(current_loc.value) == nil
        new_list.add(current_loc.value)
      end
      current_loc = current_loc.next_node
    end
    new_list
  end
end
