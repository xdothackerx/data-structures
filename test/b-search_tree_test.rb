require "minitest/spec"
require "minitest/autorun"
require "./lib/b-search_tree"

describe "Binary search tree" do
  before do
    @tree = BinarySearchTree.new(3)
  end

  it "inserts a value into the tree, but ignores it if already present with insert(self, val)" do
    @tree.value.must_equal(3)
    @tree.insert(5)
    @tree.right.value.must_equal(5)
    err = ->{ @tree.insert(3) }.must_raise(RuntimeError)
    err.message.must_match /That value is already in the tree./
  end

  it "returns true if value is in the tree, false if not with contains(value)" do
    @tree.contains(3).must_equal(true)
    @tree.insert(2)
    @tree.contains(2).must_equal(true)
    @tree.insert(6)
    @tree.contains(6).must_equal(true)
    @tree.contains(4).must_equal(false)
  end

  it "returns the integer size of the tree, or 0 if the tree is empty" do
    @tree.size.must_equal(1)
    @tree.insert(5)
    @tree.insert(4)
    @tree.insert(2)
    @tree.size.must_equal(4)
  end

  it "returns an integer representing the total number of levels in the tree. if there is one value, the depth should be 1" do
    @tree.depth.must_equal(1)
    @tree.insert(5)
    @tree.depth.must_equal(2)
    @tree.insert(4)
    @tree.depth.must_equal(3)
    @tree.insert(2)
    @tree.depth.must_equal(3)
  end

  it "returns an integer to represent how balanced the tree is. Trees which are deeper on the left return a positive,
  trees which are deeper on the right return negative. 0 is perfectly balanced." do
    @tree.balance.must_equal(0)
    @tree.insert(5)
    @tree.insert(4)
    @tree.insert(2)
    @tree.balance.must_equal(-1)
    @tree.insert(1)
    @tree.insert(0)
    @tree.balance.must_equal(1)
  end
end

describe "Binary Search Tree travsersal" do
  before do
    @tree = BinarySearchTree.new(10)
    numbers = [8, 6, 12, 5, 13, 20, 3, 16, 19, 14, 18, 9, 4, 7, 17, 15, 11, 2, 1]
    numbers.each do |n|
      @tree.insert(n)
    end
  end

  it "returns the values in the tree using in-order traversal" do
    @tree.pre_order.must_equal([10, 8, 6, 5, 3, 2, 1, 4, 7, 9, 12, 11, 13, 20, 16, 14, 15, 19, 18, 17])
  end
  it "returns the values in the tree using pre-order traversal" do
    @tree.in_order.must_equal([1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20])
  end
  it "returns the values in the tree using post_order traversal" do
    @tree.post_order.must_equal([1, 2, 4, 3, 5, 7, 6, 9, 8, 11, 15, 14, 17, 18, 19, 16, 20, 13, 12, 10])
  end
  it "returns the values in the tree using breadth-first traversal" do
    @tree.breadth_first.must_equal([10, 8, 12, 6, 9, 11, 13, 5, 7, 20, 3, 16, 2, 4, 14, 19, 1, 15, 18, 17])
  end
end
