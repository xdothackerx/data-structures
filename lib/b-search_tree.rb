class BinarySearchTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
    @left = NullTree.new
    @left.parent = self
    @right = NullTree.new
    @right.parent = self
  end

  def insert(value)
    if value < @value
        @left.insert(value)
    elsif value > @value
        @right.insert(value)
    else
      raise "That value is already in the tree."
    end
  end

  def contains(value)
    if value < @value
      @left.contains(value)
    elsif value > @value
      @right.contains(value)
    else
      true
    end
  end

  def size
    @left.size + @right.size + 1
  end

  def depth
    1 + [@left.depth, @right.depth].max
  end

  def balance
    0 + @left.depth - @right.depth
  end

  def pre_order(result = [])
    result << @value
    @left.pre_order(result)
    @right.pre_order(result)
    result
  end

  def in_order(result = [])
    @left.in_order(result)
    result << @value
    @right.in_order(result)
    result
  end

  def post_order(result = [])
    @left.post_order(result)
    @right.post_order(result)
    result << @value
  end

  def breadth_first
    result = []
    queue = [self]
    until queue.empty?
      current = queue.shift
      result << current.value
      queue << current.left unless current.left.is_a? NullTree
      queue << current.right unless current.right.is_a? NullTree
    end
    result
  end
end

class NullTree
  attr_accessor :parent

  def contains(value)
    false
  end

  def insert(value)
    if value < parent.value
      @parent.left = BinarySearchTree.new(value)
    else
      @parent.right = BinarySearchTree.new(value)
    end
  end

  def size
    0
  end

  def depth
    0
  end

  def pre_order(value)
    nil
  end

  def in_order(value)
    nil
  end

  def post_order(value)
    nil
  end

end
