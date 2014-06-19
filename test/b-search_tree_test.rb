require "minitest/spec"
require "minitest/autorun"
require "./lib/b-search_tree"

describe "Binary search tree" do
  it "inserts a value into the tree, but ignores it if already present with insert(self, val)" do
    tree = BinarySearchTree.new(3)
    tree.value.must_equal(3)
    tree.insert(5)
    tree.right.value.must_equal(5)
    err = ->{ tree.insert(3) }.must_raise(RuntimeError)
    err.message.must_match /That value is already in the tree./
  end

  it "returns true if value is in the tree, false if not with contains(value)" do
    tree = BinarySearchTree.new(3)
    tree.contains(3).must_equal(true)
    tree.insert(2)
    tree.contains(2).must_equal(true)
    tree.insert(6)
    tree.contains(6).must_equal(true)
    tree.contains(4).must_equal(false)
  end

  it "returns the integer size of the tree, or 0 if the tree is empty" do

  end
end
