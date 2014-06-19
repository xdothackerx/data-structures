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
    0 - @left.depth + @right.depth
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
end
