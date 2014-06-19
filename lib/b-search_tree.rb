class BinarySearchTree
  attr_accessor :value, :left, :right

  def initialize(value)
    @value = value
  end

  def insert(value)
    new_tree = BinarySearchTree.new(value)
    new_tree_val = new_tree.value
    if new_tree_val < @value
      if @left.nil?
        @left = new_tree
      else
        @left.insert(value)
      end
    elsif new_tree_val > @value
      if @right.nil?
        @right = new_tree
      else
        @right.insert(value)
      end
    else
      raise "That value is already in the tree."
    end
  end

  def contains(value, results = [])
    if @value == value
      results << true
    else
      results << false
    end
    @left.contains(value, results) if @left
    @right.contains(value, results) if @right
    if results.include? true
      true
    else
      false
    end
  end

  # def size(count = 1)
  #   @left.size(count) if @left
  #   @right.size(count) if @right
  #   count += 1
  # end

end
